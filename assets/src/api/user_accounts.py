from flask import Blueprint, jsonify, abort, request
from ..models import UserAccount, db

bp = Blueprint('useraccounts', __name__, url_prefix='/useraccounts')

@bp.route('', methods=['GET'])
def index():
    useraccounts = UserAccount.query.all() 
    result = []
    for ua in useraccounts:
        result.append(ua.serialize()) 
    return jsonify(result) 


@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    ua = UserAccount.query.get_or_404(id)
    return jsonify(ua.serialize())

@bp.route('', methods=['POST'])
def create():
    ua = UserAccount(
        username=request.json['username'],
        password=request.json['password'],
        user_id=request.json['user_id']
    )
    db.session.add(ua) 
    db.session.commit() 
    return jsonify(ua.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    ua = UserAccount.query.get_or_404(id)
    try:
        db.session.delete(ua) 
        db.session.commit() 
        return jsonify(True)
    except:
        return jsonify(False)

@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def update(id: int):
    ua = UserAccount.query.get_or_404(id)

    if 'user_name' not in request.json :
        return abort(400)
    
    if 'user_name' in request.json:
        ua.user_name = request.json['user_name']
    
    if 'password' in request.json:
        ua.password = request.json['password']
    
    if 'user_id' in request.json:
        ua.user_id = request.json['user_id']

    try:
        db.session.commit() 
        return jsonify(ua.serialize())
    except:
        return jsonify(False)