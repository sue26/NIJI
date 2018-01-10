from flask import Flask, render_template, flash, redirect, url_for, session, logging, request
from data import Appetizers, Lunch, Tray, SoupNSalad, Maki, VegMaki, Maki2
# from flask_mysqldb import MySQL
# from wtforms import Form, StringField, IntegerField
# from sassutils.wsgi import SassMiddleware

app = Flask(__name__)
app.debug = True

# mysql = MySQL()
# app.config['MYSQL_DATABASE_USER'] = 'root'
# app.config['MYSQL_DATABASE_PASSWORD'] = 'tnWJD123~!'
# app.config['MYSQL_DATABASE_DB'] = 'niji'
# app.config['MYSQL_DATABASE_HOST'] = 'localhost'
# mysql.init_app(app)
# app.wsgi_app = SassMiddleware(app.wsgi_app, {
#     'myapp': ('static/sass', 'static/css', '/static/css')
# })

Appetizers = Appetizers()
Lunch = Lunch()
Tray = Tray()
SoupNSalad = SoupNSalad()
Maki = Maki()
VegMaki = VegMaki()
Maki2 = Maki2()

@app.route('/form')
def form():
    return render_template('form.html')

@app.route('/submitted', methods=['POST'])
def submitted_form():
    name = request.form['name']
    email = request.form['email']
    site = request.form['site_url']
    comments = request.form['comments']
    
    return render_template(
    'submitted_form.html',
    name=name,
    email=email,
    site=site,
    comments=comments)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/menu')
def menu():

    return render_template('menu.html', appetizers=Appetizers, lunch=Lunch, 
        tray=Tray, soupNsalad=SoupNSalad, maki=Maki, vegMaki=VegMaki, maki2=Maki2)
