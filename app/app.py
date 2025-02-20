from flask import Flask, session
from controllers import book_controller

app = Flask(__name__)
app.secret_key = 'your_secret_key'  # Change this to a random secret key for session management

# Register the blueprint
app.register_blueprint(book_controller)

if __name__ == '__main__':
    app.run(debug=True)
