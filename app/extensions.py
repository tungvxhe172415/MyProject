import os


from flask_sqlalchemy import SQLAlchemy
from flask_jwt_extended import JWTManager
from flask_redis import Redis
from flask_migrate import Migrate
from .settings import DevConfig

CONFIG = DevConfig if os.environ.get('ENV') == 'prd' else DevConfig if os.environ.get('ENV') == 'stg' else DevConfig


jwt = JWTManager()

# init SQLAlchemy
db = SQLAlchemy()
migrate = Migrate()


# redis
red = Redis()

