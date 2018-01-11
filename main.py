from flask import Flask, render_template, flash, redirect, url_for, session, logging, request
from flask_mysqldb import MySQL
from wtforms import Form, StringField, IntegerField
# from sassutils.wsgi import SassMiddleware

app = Flask(__name__)
app.debug = True

mysql = MySQL()
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'tnWJD123~!'
app.config['MYSQL_DB'] = 'niji'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor' #from tuple to dictionary
mysql.init_app(app)

# app.wsgi_app = SassMiddleware(app.wsgi_app, {
#     'myapp': ('static/sass', 'static/css', '/static/css')
# })

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
    cur = mysql.connection.cursor()
    result = cur.execute('select distinct m_id from options')
    result2 = cur.fetchall()
    optionsArray = []
    for o in result2:
        optionsArray.append(o['m_id'])

    result = cur.execute('select * from options')
    options = cur.fetchall()

    result = cur.execute('select * from menu where type="lunch"')
    lunch = cur.fetchall()

    result = cur.execute('select * from menu where type="appetizer"')
    appetizers = cur.fetchall()

    result = cur.execute('select * from menu where type="tray"')
    tray = cur.fetchall()

    result = cur.execute('select * from menu where type="soupNsalad"')
    soupNsalad = cur.fetchall()

    result = cur.execute('select * from menu where type="maki"')
    maki = cur.fetchall()

    result = cur.execute('select * from menu where type="vegmaki"')
    vegmaki = cur.fetchall()

    result = cur.execute('select * from menu where type="alacarte"')
    alacarte = cur.fetchall()

    result = cur.execute('select * from menu where type="sashimi"')
    sashimi = cur.fetchall()

    result = cur.execute('select * from menu where type="maindish"')
    maindish = cur.fetchall()

    result = cur.execute('select * from menu where type="sushidinner"')
    sushidinner = cur.fetchall()

    result = cur.execute('select * from menu where type="love"')
    love = cur.fetchall()

    result = cur.execute('select * from menu where type="bento"')
    bento = cur.fetchall()

    return render_template('menu.html', optionsArray=optionsArray,options=options, 
        appetizers=appetizers, lunch=lunch, tray=tray, soupNsalad=soupNsalad, 
        maki=maki, vegMaki=vegmaki, alacarte=alacarte, sashimi=sashimi,
        maindish=maindish, sushidinner=sushidinner, love=love, bento=bento)


if __name__ == '__main__':
    app.run(debug=True)
