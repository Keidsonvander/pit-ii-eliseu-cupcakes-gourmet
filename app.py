from flask import Flask, jsonify, request, send_from_directory
import sqlite3
from pathlib import Path
from datetime import datetime

BASE_DIR = Path(__file__).resolve().parent
DB_PATH = BASE_DIR / 'database' / 'cupcakes.db'
SCHEMA_PATH = BASE_DIR / 'database' / 'schema.sql'

app = Flask(__name__, static_folder='.', static_url_path='')


def connect_db():
    DB_PATH.parent.mkdir(parents=True, exist_ok=True)
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn


def init_db():
    with connect_db() as conn:
        if SCHEMA_PATH.exists():
            conn.executescript(SCHEMA_PATH.read_text(encoding='utf-8'))
        else:
            conn.execute('''CREATE TABLE IF NOT EXISTS pedidos (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                codigo TEXT UNIQUE NOT NULL,
                nome_cliente TEXT NOT NULL,
                telefone TEXT NOT NULL,
                modalidade TEXT NOT NULL,
                endereco TEXT,
                pagamento TEXT NOT NULL,
                total REAL NOT NULL,
                status TEXT NOT NULL DEFAULT 'Recebido',
                criado_em TEXT NOT NULL
            )''')
            conn.commit()


@app.route('/')
def home():
    return send_from_directory(BASE_DIR, 'index.html')


@app.post('/api/pedidos')
def criar_pedido():
    dados = request.get_json(silent=True) or {}
    obrigatorios = ['nome_cliente', 'telefone', 'modalidade', 'pagamento', 'total']
    faltantes = [campo for campo in obrigatorios if dados.get(campo) in (None, '')]
    if dados.get('modalidade') == 'entrega' and not dados.get('endereco'):
        faltantes.append('endereco')
    if faltantes:
        return jsonify({'erro': 'Campos obrigatórios ausentes', 'campos': faltantes}), 400

    codigo = f"PED-{datetime.now().strftime('%Y%m%d%H%M%S%f')[-10:]}"
    with connect_db() as conn:
        conn.execute('''INSERT INTO pedidos
            (codigo, nome_cliente, telefone, modalidade, endereco, pagamento, total, status, criado_em)
            VALUES (?, ?, ?, ?, ?, ?, ?, 'Recebido', ?)''',
            (codigo, dados['nome_cliente'], dados['telefone'], dados['modalidade'], dados.get('endereco'),
             dados['pagamento'], float(dados['total']), datetime.now().isoformat(timespec='seconds')))
        conn.commit()
    return jsonify({'codigo': codigo, 'status': 'Recebido'}), 201


@app.get('/api/pedidos/<codigo>')
def consultar_pedido(codigo):
    with connect_db() as conn:
        pedido = conn.execute('SELECT * FROM pedidos WHERE codigo = ?', (codigo,)).fetchone()
    if not pedido:
        return jsonify({'erro': 'Pedido não encontrado'}), 404
    return jsonify(dict(pedido))


if __name__ == '__main__':
    init_db()
    app.run(host='0.0.0.0', port=5000, debug=False)
