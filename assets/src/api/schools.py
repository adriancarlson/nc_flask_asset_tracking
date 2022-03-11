from flask import Blueprint, jsonify, abort, request
from ..models import School, db

bp = Blueprint('schools', __name__, url_prefix='/schools')

@bp.route('', methods=['GET']) 
def index():
    schools = School.query.all() 
    result = []
    for s in schools:
        result.append(s.serialize()) 
    return jsonify(result) 


@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    s = School.query.get_or_404(id)
    return jsonify(s.serialize())

@bp.route('', methods=['POST'])
def create():
    s = School(
        name=request.json['name'],
        address_line_1=request.json['address_line_1'],
        address_line_2=request.json['address_line_2'],
        city=request.json['city'],
        state=request.json['state'],
        zip=request.json['zip']
    )
    db.session.add(s) 
    db.session.commit() 
    return jsonify(s.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    s = School.query.get_or_404(id)
    try:
        db.session.delete(s) 
        db.session.commit() 
        return jsonify(True)
    except:
        # something went wrong :(
        return jsonify(False)

@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def update(id: int):
    s = School.query.get_or_404(id)
    
    if 'name' in request.json:
        s.name = request.json['name']
    
    if 'address_line_1' in request.json:
        s.address_line_1 = request.json['address_line_1']
    
    if 'address_line_2' in request.json:
        s.address_line_2 = request.json['address_line_2']
    
    if 'city' in request.json:
        s.city = request.json['city']
    
    if 'state' in request.json:
        s.state = request.json['state']
    
    if 'zip' in request.json:
        s.zip = request.json['zip']

    try:
        db.session.commit() 
        return jsonify(s.serialize())
    except:
        return jsonify(False)