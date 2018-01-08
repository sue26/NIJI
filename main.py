from flask import Flask, render_template, flash, redirect, url_for, session, logging, request
from data import Menu
# from sassutils.wsgi import SassMiddleware

app = Flask(__name__)
app.debug = True
# app.wsgi_app = SassMiddleware(app.wsgi_app, {
#     'myapp': ('static/sass', 'static/css', '/static/css')
# })
Menu = Menu();

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
    return render_template('menu.html', menu=Menu)
