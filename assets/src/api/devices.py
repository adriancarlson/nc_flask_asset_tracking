from flask import Blueprint, jsonify, abort, request
from ..models import Device, db

bp = Blueprint('devices', __name__, url_prefix='/devices')

@bp.route('', methods=['GET'])
def index():
    devices = Device.query.all() 
    result = []
    for d in devices:
        result.append(d.serialize()) 
    return jsonify(result) 


@bp.route('/<int:id>', methods=['GET'])
def show(id: int):
    d = Device.query.get_or_404(id)
    return jsonify(d.serialize())

@bp.route('', methods=['POST'])
def create():
    d = Device(
        serial_number=request.json['serial_number'],
        purchase_date=request.json['purchase_date'],
        manufacture=request.json['manufacture'],
        model=request.json['model'],
        status=request.json['status'],
        condition=request.json['condition'],
        school_id=request.json['school_id']
    )
    db.session.add(d) 
    db.session.commit() 
    return jsonify(d.serialize())

@bp.route('/<int:id>', methods=['DELETE'])
def delete(id: int):
    d = Device.query.get_or_404(id)
    try:
        db.session.delete(d) 
        db.session.commit() 
        return jsonify(True)
    except:
        return jsonify(False)

@bp.route('/<int:id>', methods=['PATCH', 'PUT'])
def update(id: int):
    d = Device.query.get_or_404(id)
    
    if 'serial_number' not in request.json :
        return abort(400)
    
    if 'serial_number' in request.json:
        d.name = request.json['serial_number']
    
    if 'purchase_date' in request.json:
        d.purchase_date = request.json['purchase_date']
    
    if 'manufacture' in request.json:
        d.manufacture = request.json['manufacture']

    if 'model' in request.json:
        d.model = request.json['model']

    if 'status' in request.json:
        d.status = request.json['status']
    
    if 'condition' in request.json:
        d.condition = request.json['condition']
    
    if 'school_id' in request.json:
        d.school_id = request.json['school_id']

    try:
        db.session.commit() 
        return jsonify(d.serialize())
    except:
        return jsonify(False)