from flask import Flask, render_template, redirect, url_for, request, session
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re

app = Flask(__name__)

app.secret_key = 'pawtropica'

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'pes1ug20cs182'
app.config['MYSQL_DB'] = 'pawtropica'
app.config["MYSQL_CURSORCLASS"] = "DictCursor"
 
mysql = MySQL(app)

@app.route("/")  
def home():
    status=''
    if 'loggedin' in session:
        status='loggedin'
        return render_template("index.html",status=status)
    return render_template("index.html",status=status)

# Route for handling the login page logic
@app.route("/login/", methods=['GET', 'POST'])
def login():
    error = None
    if request.method=='POST':
        username = request.form['username']
        user_pwd = request.form['password']

        
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM users WHERE username = %s AND user_pwd = %s', (username, user_pwd, ))
        user = cursor.fetchone()

        if user:
            session['loggedin']=True
            session['username']=user['username']
            session['usertype']=user['user_type']
            return redirect(url_for('booking'))
        else:
            error="Incorrect username/password. Please Try Again."
    return render_template('login.html', error=error)


@app.route('/logout/')
def logout():
    session.pop('loggedin', None)
    session.pop('username', None)
    session.pop('user_type', None)
    return redirect(url_for('login'))


@app.route('/register/', methods =['GET', 'POST'])
def register():
    msg = ''
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form and 'email_id' in request.form :
        username = request.form['username']
        password = request.form['password']
        email_id = request.form['email_id']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM users WHERE username = % s', (username, ))
        account = cursor.fetchone()
        if account:
            msg = 'Account already exists !'
        elif not re.match(r'[^@]+@[^@]+\.[^@]+', email_id):
            msg = 'Invalid email address !'
        elif not re.match(r'[A-Za-z0-9]+', username):
            msg = 'Username must contain only characters and numbers !'
        elif not username or not password or not email_id:
            msg = 'Please fill out the form !'
        else:
            cursor.execute('INSERT INTO users (username,user_pwd,email_id) VALUES (% s, % s, % s)', (username, password, email_id, ))
            mysql.connection.commit()
            msg = 'You have successfully registered !'
    elif request.method == 'POST':
        msg = 'Please fill out the form !'
    return render_template('register.html', msg = msg)

@app.route("/booking",methods=['GET', 'POST'])  
def booking():
    msg = ''
    if 'loggedin' in session:
        if request.method == 'POST' and 'pet_name' in request.form :
            username = session['username']
            pet_name= request.form['pet_name']
            booking_time = request.form['booking_time']
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute('SELECT * FROM users WHERE username = % s', (username, ))
            account = cursor.fetchone()
            if account:
                cursor.execute('INSERT INTO bookings (cust_name, pet_name, booking_time) VALUES (% s, % s, % s)', (username, pet_name, booking_time, ))
                mysql.connection.commit()
                msg = 'You have successfully made a booking !'
            else:
                msg = 'You do not have an account! Make an account!'
        elif request.method == 'POST':
            msg = 'Please fill out the form !'
        return render_template('booking.html', msg = msg)
    return redirect(url_for('login'))

@app.route("/view_booking/")
def view_booking():
    username=session['username']
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT * FROM bookings where cust_name = % s',(username,))
    bookings = cursor.fetchall()
    return render_template('view_booking.html', data=bookings)



if __name__ == "__main__":
    app.run(debug=True)