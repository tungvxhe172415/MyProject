from app.app import create_app
from flask import Flask, render_template, request, jsonify


app = create_app()

@app.route('/')
def hello():
    return "Hello, World!"

@app.route('/qr_updatepoint')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    """
    Main Application
    python manage.py
    """
    app.run(host='0.0.0.0', port=5012)
