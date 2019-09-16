import re
from flask import Flask, render_template, flash, redirect, url_for, session, logging, request
from flask_mysqldb import MySQL
from wtforms import Form, StringField, TextAreaField, BooleanField, SelectField, validators
from functools import wraps
from jinja2 import evalcontextfilter, Markup, escape
# from sassutils.wsgi import SassMiddleware

app = Flask(__name__)
app.secret_key = "secret"

app.config['PERMANENT_SESSION_LIFETIME'] = 10800 #Timeout after 3 hours

mysql = MySQL()
app.config['MYSQL_USER'] = 'nijisushi'
app.config['MYSQL_PASSWORD'] = 'tnwjddlek'
app.config['MYSQL_DB'] = 'nijisushi$niji'
app.config['MYSQL_HOST'] = 'nijisushi.mysql.pythonanywhere-services.com'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor' #from tuple to dictionary
mysql.init_app(app)

_paragraph_re = re.compile(r'(?:\r\n|\r|\n){2,}')

@app.template_filter()
@evalcontextfilter
def nl2br(eval_ctx, value):
    result = u'\n\n'.join(u'<p>%s</p>' % p.replace('\n', '<br>\n') \
        for p in _paragraph_re.split(escape(value)))
    if eval_ctx.autoescape:
        result = Markup(result)
    return result

def is_logged_in(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if 'logged_in' in session:
            return f(*args, **kwargs)
        else:
            flash('Unauthorized. Please login', 'danger')
            return redirect(url_for('login'))
    return wrap

class MenuForm(Form):
    num = StringField('Number')
    name = StringField('Name', [validators.InputRequired(), validators.Length(min=1, max=100)])
    description = TextAreaField('Description', [validators.Length(max=255)])
    price = StringField('Price')
    price1 = StringField('Price #1')
    price2 = StringField('Price #2')
    type = SelectField('Type', [validators.required()], choices = [('lunch', 'Lunch'), ('appetizer', 'Appetizer'), ('tray', 'Tray'),
     ('soupNsalad', 'Soup & Salad'), ('maki', 'Maki'), ('vegmaki', 'Veg Maki'), ('alacarte', 'A la Carte'),
      ('sashimi', 'Sashimi'), ('maindish', 'Main Dish'), ('sushidinner', 'Sushi Dinner'), ('love', 'Love Boat'),
       ('bento', 'Bento Box')])

class OptionForm(Form):
    name = StringField('Name', [validators.required()])
    description = TextAreaField('Description', [validators.Length(max=255)])
    price = StringField('Price', [validators.required()])
    m_id = StringField('m_id', [validators.required()])

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/menu/')
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

    result = cur.execute('select * from menu where type="maki" order by num')
    maki = cur.fetchall()

    result = cur.execute('select * from menu where type="vegmaki" order by num')
    vegmaki = cur.fetchall()

    result = cur.execute('select * from menu where type="alacarte"')
    alacarte = cur.fetchall()

    result = cur.execute('select * from menu where type="sashimi"')
    sashimi = cur.fetchall()

    result = cur.execute('select * from menu where type="maindish" order by num')
    maindish = cur.fetchall()

    result = cur.execute('select * from menu where type="sushidinner" order by num')
    sushidinner = cur.fetchall()

    result = cur.execute('select * from menu where type="love"')
    love = cur.fetchall()

    result = cur.execute('select * from menu where type="bento"')
    bento = cur.fetchall()

    cur.close()

    return render_template('menu.html', optionsArray=optionsArray,options=options,
        appetizers=appetizers, lunch=lunch, tray=tray, soupNsalad=soupNsalad,
        maki=maki, vegMaki=vegmaki, alacarte=alacarte, sashimi=sashimi,
        maindish=maindish, sushidinner=sushidinner, love=love, bento=bento)

@app.route('/vegmenu/')
def vegmenu():
    cur = mysql.connection.cursor()
    cur.execute('select * from menu where vege="1" and not (type="lunch" or type="maki" or type="vegmaki" or type="alacarte")')
    veg = cur.fetchall()
    cur.execute('select * from menu where vege="2" and not (type="lunch" or type="maki" or type="vegmaki" or type="alacarte")')
    veg2 = cur.fetchall()
    cur.execute('select * from menu where vege="1" and type="lunch"')
    vegLunch = cur.fetchall()
    cur.execute('select * from menu where vege="1" and type="alacarte"')
    vegAlacarte = cur.fetchall()
    cur.execute('select * from menu where not vege="0" and (type="maki" or type="vegmaki")')
    vegMaki = cur.fetchall()
    cur.execute('select * from menu where vege="2" and type="lunch"')
    veg2Lunch = cur.fetchall()
    cur.close()

    return render_template('vegmenu.html', veg=veg, veg2=veg2, vegLunch=vegLunch, veg2Lunch=veg2Lunch,
        vegAlacarte=vegAlacarte, vegMaki=vegMaki)

@app.route('/contactUs/')
def contactUs():
    return render_template('contactUs.html')

@app.route('/admin/', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        # Get Form Fields
        username = request.form['username']
        password_candidate = request.form['password']

        cur = mysql.connection.cursor()

        result = cur.execute('select password from user where username = %s', [username])

        if result > 0:
            data = cur.fetchone()
            cur.close()

            if password_candidate == data['password']:
                app.logger.info('PASSWORD MATCHED')
                session['logged_in'] = True
                session['username'] = username

                return redirect(url_for('dashboard'))
            else :
                flash('INCORRECT USERNAME OR PASSWORD', 'danger')
                return render_template('admin.html')
        else:
            flash('INCORRECT USERNAME OR PASSWORD', 'danger')
            return render_template('admin.html')

        return render_template('admin.html')

    if 'logged_in' in session:
        return redirect(url_for('dashboard'))

    return render_template('admin.html')

@app.route('/dashboard/')
@is_logged_in
def dashboard():
    cur = mysql.connection.cursor()
    result = cur.execute('select id, num, name, type, description from menu')
    menu = cur.fetchall()

    result = cur.execute('select distinct type from menu')
    types = cur.fetchall()
    typesArray = []
    for o in types:
        typesArray.append(o['type'])


    cur.close()

    return render_template('dashboard.html', menu=menu, types=typesArray)

@app.route('/edit_menu/<string:id>/', methods=['GET', 'POST'])
@is_logged_in
def edit_menu(id):
    cur = mysql.connection.cursor()
    result = cur.execute('select * from menu where id = %s', [id])
    item = cur.fetchone()

    result = cur.execute('select distinct m_id from options')
    result2 = cur.fetchall()

    result = cur.execute('select * from options where m_id = %s', [id])
    options = cur.fetchall()

    cur.close()

    form = MenuForm(request.form)

    form.num.data = item['num']
    form.name.data = item['name']
    form.description.data = item['description']
    form.price.data = item['price']
    form.price1.data = item['price1']
    form.price2.data = item['price2']
    form.type.data = item['type']
    app.logger.info(request.form)

    if request.method == 'POST' and form.validate():
        # Update menu & options(if applicable)
        num = request.form['num']
        name = request.form['name']
        description = request.form['description']
        type = request.form['type']
        price = request.form['price']
        price1 = request.form['price1']
        price2 = request.form['price2']


        cur = mysql.connection.cursor()
        cur.execute('update menu set num=%s, name=%s, description=%s, price=%s, price1=%s, price2=%s, type=%s where id=%s',
            (num, name, description, price, price1, price2, type, id))
        mysql.connection.commit()

        cur.close()

        flash('Menu ' + name + ' updated','success')
        return redirect(url_for('dashboard'))



    return render_template('edit_menu.html', form=form, options=options, id=id)

@app.route('/add_menu', methods=['GET', 'POST'])
@is_logged_in
def add_menu():
    form = MenuForm(request.form)

    if request.method == 'POST' and form.validate():
        num = request.form['num']
        name = request.form['name']
        description = request.form['description']
        price = request.form['price']
        price1 = request.form['price1']
        price2 = request.form['price2']
        type = request.form['type']


        cur = mysql.connection.cursor()
        cur.execute('insert into menu (num, name, description, price, price1, price2, type) values (%s,%s,%s,%s,%s,%s,%s)',
            (num, name, description, price, price1, price2, type))
        mysql.connection.commit()

        result = cur.execute('select id from menu where num=%s and name=%s', (num, name))
        id = cur.fetchone()

        flash('Successfully added ' + name + ' to ' + type, 'success')
        return redirect(url_for('dashboard'))

    return render_template('add_menu.html', form=form)

@app.route('/delete_menu/<string:id>/')
@is_logged_in
def delete_menu(id):
    cur = mysql.connection.cursor()
    cur.execute('delete from options where m_id=%s', [id])
    cur.execute('delete from menu where id=%s', [id])
    mysql.connection.commit()

    cur.close()
    flash('Successfully deleted', 'success')
    return redirect(url_for('dashboard'))

@app.route('/edit_option/<string:id>/', methods=['GET', 'POST'])
@is_logged_in
def edit_option(id):
    cur = mysql.connection.cursor()
    result = cur.execute('select * from options where id = %s', [id])
    option = cur.fetchone()

    result = cur.execute('select name from menu where id = %s', [option['m_id']])
    menu = cur.fetchone()

    cur.close()

    form = OptionForm(request.form)
    form.name.data = option['name']
    form.description.data = option['description']
    form.price.data = option['price']
    form.m_id.data = option['m_id']

    if request.method == 'POST' and form.validate():
        name = request.form['name']
        description = request.form['description']
        price = request.form['price']

        cur = mysql.connection.cursor()
        cur.execute('update options set name=%s, description=%s, price=%s where id=%s', (name, description, price, id))
        mysql.connection.commit()
        cur.close()

        flash('Successfully updated option ' + str(option['m_id']), 'success')
        return redirect(url_for('edit_menu', id=option['m_id']))

    return render_template('edit_option.html', form=form, menu=menu)

@app.route('/add_option/<string:m_id>/', methods=['GET', 'POST'])
@is_logged_in
def add_option(m_id):
    cur = mysql.connection.cursor()
    result = cur.execute('select name from menu where id = %s', [m_id])
    menu = cur.fetchone()
    cur.close()

    form = OptionForm(request.form)
    form.m_id.data = m_id

    if request.method == 'POST' and form.validate():
        name = request.form['name']
        description = request.form['description']
        price = request.form['price']

        cur = mysql.connection.cursor()
        cur.execute('insert into options (name, description, price, m_id) values (%s, %s, %s, %s)', (name, description, price, m_id))
        mysql.connection.commit()
        cur.close()

        flash('Successfully added option ' + str(m_id), 'success')
        return redirect(url_for('edit_menu', id=m_id))

    return render_template('add_option.html', form=form, menu=menu)

@app.route('/delete_option/<string:id>/')
@is_logged_in
def delete_option(id):
    cur = mysql.connection.cursor()
    result = cur.execute('select m_id from options where id=%s', [id])
    result2 = cur.fetchone()

    m_id = result2['m_id']

    cur.execute('delete from options where id=%s', [id])
    mysql.connection.commit()

    cur.close()

    flash('Successfully deleted option ' + str(m_id), 'success')
    return redirect(url_for('edit_menu', id=m_id))



@app.route('/logout')
@is_logged_in
def logout():
    session.clear()
    flash('You are now logged out', 'success')
    return redirect(url_for('login'))

if __name__ == '__main__':
    app.secret_key = 'secretsecret'
    app.run(debug=True)
