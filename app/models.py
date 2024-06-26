# coding: utf-8

from app.extensions import db




class User(db.Model):
    __tablename__ = 'user'

    id = db.Column(db.String(50), primary_key=True)
    email = db.Column(db.String(100, collation="utf8mb4_vietnamese_ci"))
    phone = db.Column(db.String(50))
    password_hash = db.Column(db.String(255))
    gender = db.Column(db.Boolean)
    full_name = db.Column(db.String(100, collation="utf8mb4_vietnamese_ci"))
    address = db.Column(db.Text)  # Tỉnh, thành của user (FE tự convert)
    avatar_url = db.Column(db.String(255)) # co the luu tren S3, hoac local
    birthday = db.Column(db.DATE)
    user_id_card = db.Column(db.String(255))






