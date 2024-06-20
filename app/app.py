from flask import Flask, request

from app.api.helper import CONFIG
from app.extensions import  jwt, db, red, migrate



def create_app(config_object=CONFIG):
    """
    Init App
    :param config_object:
    :return:
    """
    app = Flask(__name__, static_url_path="/files", static_folder="./files")
    app.config.from_object(config_object)
    register_extensions(app)
    register_blueprints(app)
    register_monitor(app)


    return app





def register_extensions(app):
    """
        Init extension
        :param app:
        :return:
        """

    db.app = app
    db.init_app(app)  # SQLAlchemy
    jwt.init_app(app)
    red.init_app(app)
    migrate.init_app(app, db)



def register_monitor(app):
    pass

def register_blueprints(app):
    pass


