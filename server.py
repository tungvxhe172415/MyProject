from app.app import create_app

app = create_app()

@app.route('/')
def hello():
    return "Hello, World!"
if __name__ == '__main__':
    """
    Main Application
    python manage.py
    """
    app.run(host='0.0.0.0', port=5012)
