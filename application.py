from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    try:
        return render_template('index.html')
    except Exception as e:
        print(f"Error al renderizar la plantilla: {e}")
        return f"Error al renderizar la plantilla: {e}", 500

@app.route('/hello')
def hello():
    return "¡Hola, Mundo!"

if __name__ == '__main__':
    app.run(debug=True)
