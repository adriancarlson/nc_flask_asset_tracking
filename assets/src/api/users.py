from flask import Blueprint, jsonify, abort, request
from ..models import User, db

bp = Blueprint('users', __name__, url_prefix='/users')

@bp.route('', methods=['GET'])
def index():
    users = User.query.all() 
    result = []
    for u in users:
        result.append(u.serialize()) 
    return jsonify(result) 


@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    u = User.query.get_or_404(id)
    return jsonify(u.serialize())

@bp.route('', methods=['POST'])
def create():
    u = User(
        first_name=request.json['first_name'],
        middle_name=request.json['middle_name'],
        last_name=request.json['last_name'],
        grade=request.json['grade'],
        user_type=request.json['user_type'],
        user_account_id=request.json['user_account_id'],
        school_id=request.json['school_id']
    )
    db.session.add(u) 
    db.session.commit() 
    return jsonify(u.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    u = User.query.get_or_404(id)
    try:
        db.session.delete(u) 
        db.session.commit() 
        return jsonify(True)
    except:
        return jsonify(False)

@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def update(id: int):
    u = User.query.get_or_404(id)

    if 'first_name' not in request.json and 'last_name' not in request.json:
        return abort(400)
    
    if 'first_name' in request.json:
        u.first_name = request.json['first_name']
    
    if 'middle_name' in request.json:
        u.middle_name = request.json['middle_name']

    if 'last_name' in request.json:
        u.last_name = request.json['last_name']

    if 'grade' in request.json:
        u.grade = request.json['grade']

    if 'user_type' in request.json:
        u.user_type = request.json['user_type']
    
    if 'user_account_id' in request.json:
        u.user_account_id = request.json['user_account_id']
    
    if 'school_id' in request.json:
        u.school_id = request.json['school_id']

    try:
        db.session.commit() 
        return jsonify(u.serialize())
    except:
        return jsonify(False)
