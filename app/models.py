import pymysql
from werkzeug.security import generate_password_hash, check_password_hash

class Database:
    def __init__(self):
        self.connection = pymysql.connect(
            host='localhost',
            user='root',
            password='',
            database='uas_pemrograman_lanjut'
        )
        self.cursor = self.connection.cursor()

    def close(self):
        self.cursor.close()
        self.connection.close()

class User:
    def __init__(self, username, password):
        self.username = username
        self.password_hash = generate_password_hash(password)

    @staticmethod
    def create_user(username, password):
        db = Database()
        password_hash = generate_password_hash(password)
        db.cursor.execute("INSERT INTO users (username, password_hash) VALUES (%s, %s)",
                         (username, password_hash))
        db.connection.commit()
        db.close()

    @staticmethod
    def get_user_by_username(username):
        db = Database()
        db.cursor.execute("SELECT * FROM users WHERE username = %s", (username,))
        user = db.cursor.fetchone()
        db.close()
        return user

    @staticmethod
    def verify_password(username, password):
        db = Database()
        db.cursor.execute("SELECT password_hash FROM users WHERE username = %s", (username,))
        result = db.cursor.fetchone()
        db.close()
        if result:
            return check_password_hash(result[0], password)
        return False

    @staticmethod
    def update_password(username, new_password):
        db = Database()
        password_hash = generate_password_hash(new_password)
        db.cursor.execute("UPDATE users SET password_hash = %s WHERE username = %s",
                         (password_hash, username))
        db.connection.commit()
        db.close()

class Book:
    def __init__(self, title, author, published_date, isbn):
        self.title = title
        self.author = author
        self.published_date = published_date
        self.isbn = isbn

    @staticmethod
    def get_all_books(page=1, per_page=10, sort_by='Nama_barang', sort_order='asc'):
        db = Database()
        offset = (page - 1) * per_page
        query = f"SELECT * FROM books ORDER BY {sort_by} {sort_order} LIMIT %s OFFSET %s"
        db.cursor.execute(query, (per_page, offset))
        books = db.cursor.fetchall()
        db.close()
        return books

    @staticmethod
    def get_book(book_id):
        db = Database()
        db.cursor.execute("SELECT * FROM books WHERE id = %s", (book_id,))
        book = db.cursor.fetchone()
        db.close()
        return book

    @staticmethod
    def create_book(book):
        db = Database()
        db.cursor.execute("INSERT INTO books (title, author, published_date, isbn,) VALUES (%s, %s, %s, %s)",
        (book.title, book.author, book.published_date, book.isbn,))
        db.connection.commit()
        db.close()

    @staticmethod
    def update_book(book_id, book):
        db = Database()
        db.cursor.execute("UPDATE books SET title = %s, author = %s, published_date = %s, isbn = %s WHERE id = %s",
        (book.title, book.author, book.published_date, book.isbn, book_id))
        db.connection.commit()
        db.close()

    @staticmethod
    def delete_book(book_id):
        db = Database()
        db.cursor.execute("DELETE FROM books WHERE id = %s", (book_id,))
        db.connection.commit()
        db.close()

    @staticmethod
    def search_books(query):
        db = Database()
        db.cursor.execute("SELECT * FROM books WHERE Nama_barang LIKE %s OR Jumlah_barang LIKE %s OR isbn LIKE %s", 
                          ('%' + query + '%', '%' + query + '%', '%' + query + '%'))
        books = db.cursor.fetchall()
        db.close()
        return books

    @staticmethod
    def count_books():
        db = Database()
        db.cursor.execute("SELECT COUNT(*) FROM books")
        count = db.cursor.fetchone()[0]
        db.close()
        return count

    @staticmethod
    def title_exists(title):
        db = Database()
        db.cursor.execute("SELECT COUNT(*) FROM books WHERE title = %s", (title,))
        exists = db.cursor.fetchone()[0] > 0
        db.close()
        return exists
