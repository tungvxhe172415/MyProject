from flask import Flask, render_template, request, jsonify, Blueprint
from pyzbar.pyzbar import decode
from PIL import Image
import hashlib
import io


#swagger
from flask_restful import Api, Resource
from flasgger import Swagger



api = Blueprint('enrollments', __name__)



def validate_token(user_id, token):
    secret_key = "secret"
    raw_data = f"{user_id}{secret_key}"
    generate_token = hashlib.sha256(raw_data.encode()).hexdigest()
    return token == generate_token


def update_point(user_id, point, token):
    #update point of that user in DB
    return f"updated for user: {user_id} with {point} points and token: {token}"


def decode_qr(image):
    decoded_objects = decode(image)
    for obj in decoded_objects:
        qr_data = obj.data.decode("utf-8")
        user_data = eval(qr_data)
        user_id = user_data.get("UserID")
        token = user_data.get("Token")
        return user_id, token
    return None, None

@api.route('/upload', methods=['POST'])
def upload_from_images():
    if 'file' not in request.files:
        return jsonify({"error": "No file part"}), 400
    file = request.files['file']
    if file.name =='':
        return jsonify({"error": "No selected file"}), 400
    try:
        img = Image.open(file.stream)
        user_id, token = decode_qr(img)
        if not user_id or not token:
            return jsonify({"error": "Invalid QR"}), 400
        if not validate_token(user_id, token):
            return jsonify({"error": "Invalid token"}), 400
        point = request.form.get("points", type=int, default=1)
        update_point(user_id, point, token)
        return jsonify({"error": "Update successfully"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

