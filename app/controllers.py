from turtle import title
from flask import Blueprint, render_template, request, redirect, url_for, session, flash
from models import Book, User

book_controller = Blueprint('book_controller', __name__)

@book_controller.route('/')
def dashboard():
    if 'username' not in session:
        return redirect(url_for('book_controller.login'))
    return render_template('dashboard.html')

@book_controller.route('/books')
def index():
    if 'username' not in session:
        return redirect(url_for('book_controller.login'))
    
    search_query = request.args.get('search', '')
    page = request.args.get('page', 1, type=int)
    sort_by = request.args.get('sort_by', 'title')
    sort_order = request.args.get('sort_order', 'asc')
    
    if search_query:
        books = Book.search_books(search_query)
    else:
        books = Book.get_all_books(page=page, sort_by=sort_by, sort_order=sort_order)

    total_books = Book.count_books()
    total_pages = (total_books // 10) + (1 if total_books % 10 > 0 else 0)

    return render_template('index.html', books=books, page=page, total_pages=total_pages, sort_by=sort_by, sort_order=sort_order)

@book_controller.route('/create', methods=['GET', 'POST'])
def create():
    if 'username' not in session:
        return redirect(url_for('book_controller.login'))
    if request.method == 'POST':
        title = request.form['title']
        author = request.form['author']
        published_date = request.form['published_date']
        isbn = request.form['isbn']
        
        if Book.title_exists(title):
            flash('A book with this title already exists.', 'error')
            return render_template('create.html')
        
        new_book = Book(title, author ,published_date, isbn,)
        Book.create_book(new_book)
        return redirect(url_for('book_controller.index'))
    return render_template('create.html')

@book_controller.route('/update/<int:book_id>', methods=['GET', 'POST'])
def update(book_id):
    if 'username' not in session:
        return redirect(url_for('book_controller.login'))
    book = Book.get_book(book_id)
    if request.method == 'POST':
        Nama_barang = request.form['Nama_barang']
        Jumlah_barang = request.form['Jumlah_barang']
        Tanggal_masuk = request.form['Tanggal_masuk']
        harga = request.form['harga']
        updated_book = Book(Nama_barang, Jumlah_barang,Tanggal_masuk, harga,)
        Book.update_book(book_id, updated_book)
        return redirect(url_for('book_controller.index'))
    return render_template('update.html', book=book)

@book_controller.route('/delete/<int:book_id>', methods=['POST'])
def delete(book_id):
    if 'username' not in session:
        return redirect(url_for('book_controller.login'))
    Book.delete_book(book_id)
    return redirect(url_for('book_controller.index'))

@book_controller.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        if User.verify_password(username, password):
            session['username'] = username
            return redirect(url_for('book_controller.dashboard'))
        else:
            return render_template('login.html', error='Invalid credentials')
    return render_template('login.html')

@book_controller.route('/logout')
def logout():
    session.pop('username', None)
    return redirect(url_for('book_controller.login'))

@book_controller.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        User.create_user(username, password)
        return redirect(url_for('book_controller.login'))
    return render_template('register.html')

@book_controller.route('/change-password', methods=['GET', 'POST'])
def change_password():
    if 'username' not in session:
        return redirect(url_for('book_controller.login'))
    if request.method == 'POST':
        username = session['username']
        old_password = request.form['old_password']
        new_password = request.form['new_password']
        if User.verify_password(username, old_password):
            User.update_password(username, new_password)
            flash('Password changed successfully', 'success')
            return redirect(url_for('book_controller.dashboard'))
        else:
            flash('Old password is incorrect', 'error')
    return render_template('change_password.html')
