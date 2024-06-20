import os

os_env = os.environ


class Config(object):
    SECRET_KEY = '3nF3Rn0'
    APP_DIR = os.path.abspath(os.path.dirname(__file__))  # This directory
    PROJECT_ROOT = os.path.abspath(os.path.join(APP_DIR, os.pardir))





class DevConfig(Config):
    """Development configuration."""
    # app config
    ENV = 'dev'
    DEBUG = True
    DEBUG_TB_ENABLED = True  # Disable Debug toolbar
    TEMPLATES_AUTO_RELOAD = True
    HOST = '0.0.0.0'

    # version
    VERSION = "0.0.1"

    # JWT Config
    JWT_SECRET_KEY = '1234567a@'
    JWT_BLACKLIST_ENABLED = True
    JWT_BLACKLIST_TOKEN_CHECKS = ['access', 'refresh']

    # mysql config
    SQLALCHEMY_DATABASE_URI = 'mysql://root:boot.ai@1273.0.0.1:3306/myproject?charset=utf8mb4'
    SQLALCHEMY_TRACK_MODIFICATIONS = True
    BK_HOST_MYSQL = '127.0.0.1'
    BK_PORT_MYSQL = '3306'
    BK_USERNAME_MYSQL = 'root'
    BK_PASSWORD_MYSQL = 'boot.ai'
    BK_DBNAME_MYSQL = 'myproject'

    # redis config
    REDIS_HOST = '127.0.0.1'
    REDIS_PORT = 6379
    REDIS_DB = 1
    # REDIS_PASSWORD = 'tung1234567890'

    # email config
    # MAIL_SERVER = 'smtp.gmail.com'
    # MAIL_PORT = 465
    # MAIL_USERNAME = 'service.fit.mta@gmail.com'
    # MAIL_PASSWORD = 'zhewbwhzallusent'
    # MAIL_DEFAULT_SENDER = 'service.fit.mta@gmail.com'
    # MAIL_USE_TLS = False
    # MAIL_USE_SSL = True
    # MAIL_DEBUG = False

    # website url
    # BASE_URL_WEBSITE = 'https://stg.fit.boot.ai'


    # SING_REGION_NAME = 'ap-southeast-1'
    # EU_REGION_NAME = 'eu-central-1'

    #
    # # Config Mongodb
    # MONGO_CONN = "mongodb://root:bootai%402022_@192.168.1.223:27017/?authMechanism=DEFAULT"
    # MONGO_DB = "fit-stg"
    # BK_HOST_MONGODB = '192.168.1.17'
    # BK_PORT_MONGODB = '27017'
    # BK_USERNAME_MONGODB = 'root'
    # BK_PASSWORD_MONGODB = 'bootai%402022_'
