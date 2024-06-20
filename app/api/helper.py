
import os


from app.settings import DevConfig, DevConfig, DevConfig




CONFIG = DevConfig if os.environ.get('ENV') == 'prd' else DevConfig if os.environ.get('ENV') == 'stg' else DevConfig
