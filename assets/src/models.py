import datetime
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class UserAccount(db.Model):
    __tablename__ = 'user_accounts'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    username = db.Column(db.String(128), unique=True, nullable=False)
    password = db.Column(db.String(128), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'), nullable=False)

    
    def __init__(self, username: str, password: str, user_id: int):
        self.username = username
        self.password = password
        self.user_id = user_id

    def serialize(self):
        return {
            'username': self.username,
            'password': self.password,
            'user_id': self.user_id
        }


class User(db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    first_name = db.Column(db.String(128), nullable=False)
    middle_name = db.Column(db.String(128))
    last_name = db.Column(db.String(128), nullable=False)
    grade = db.Column(db.Integer)
    user_type = db.Column(db.String(128), nullable=False)
    user_account_id = db.Column(db.Integer, db.ForeignKey('user_accounts.id'), nullable=False)
    school_id = db.Column(db.Integer, db.ForeignKey('schools.id'), nullable=False)
    
    def __init__(self, first_name: str, middle_name: str, last_name: str, grade: int, user_type: str, user_account_id: int, school_id: int):
        self.first_name = first_name
        self.middle_name = middle_name
        self.last_name = last_name
        self.grade = grade
        self.user_type = user_type
        self.user_account_id = user_account_id
        self.school_id = school_id
    
    def serialize(self):
        return {
            'first_name': self.first_name,
            'middle_name': self.middle_name,
            'last_name': self.last_name,
            'grade': self.grade,
            'user_type': self.user_type,
            'user_account_id': self.user_account_id,
            'school_id': self.school_id
        }

devices_users = db.Table(
    'devices_users',
    db.Column(
        'user_id', db.Integer,
        db.ForeignKey('users.id'),
        primary_key=True
    ),

    db.Column(
        'device_id', db.Integer,
        db.ForeignKey('devices.id'),
        primary_key=True
    )
)



class Device(db.Model):
    __tablename__ = 'devices'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    serial_number = db.Column(db.Integer, nullable=False)
    purchase_date = db.Column(db.DateTime, nullable=False)
    manufacture = db.Column(db.String(128), nullable=False)
    model = db.Column(db.String(128), nullable=False)
    status = db.Column(db.String(128), nullable=False)
    condition = db.Column(db.String(128), nullable=False)
    school_id = db.Column(db.Integer, db.ForeignKey('schools.id'), nullable=False)
    
    def __init__(self, serial_number: int, purchase_date: str, manufacture: str, model: str, status: str, condition: str, school_id: int):
        self.serial_number = serial_number
        self.purchase_date = purchase_date
        self.manufacture = manufacture
        self.model = model
        self.status = status
        self.condition = condition
        self.school_id = school_id
    
    def serialize(self):
        return {
            'serial_number': self.serial_number,
            'purchase_date': self.purchase_date,
            'manufacture': self.manufacture,
            'model': self.model,
            'status': self.status,
            'condition': self.condition,
            'school_id': self.school_id
        }


class School(db.Model):
    __tablename__ = 'schools'
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String(128), unique=True, nullable=False)
    address_line_1 = db.Column(db.String(128), nullable=False)
    address_line_2 = db.Column(db.String(128))
    city = db.Column(db.String(128), nullable=False)
    state = db.Column(db.String(2), nullable=False)
    zip = db.Column(db.Integer, nullable=False)
    
    def __init__(self, name: str, address_line_1: str, address_line_2: str, city: str, state: str, zip: int):
        self.name = name
        self.address_line_1 = address_line_1
        self.address_line_2 = address_line_2
        self.city = city
        self.state = state
        self.zip = zip
    
    def serialize(self):
        return {
            'name': self.name,
            'address_line_1': self.address_line_1,
            'address_line_2': self.address_line_2,
            'city': self.city,
            'state': self.state,
            'zip': self.zip
        }



