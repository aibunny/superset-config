import os
from dotenv import load_dotenv
load_dotenv()


# Superset specific config
ROW_LIMIT = 5000

SUPERSET_SECRET_KEY="$(openssl rand -base64 42)"
SECRET_KEY="$(openssl rand -base64 42)"
# Flask-WTF flag for CSRF
WTF_CSRF_ENABLED = True
# Add endpoints that need to be exempt from CSRF protection
WTF_CSRF_EXEMPT_LIST = []
# A CSRF token that expires in 1 year
WTF_CSRF_TIME_LIMIT = 60 * 60 * 24 * 365

# Set this API key to enable Mapbox visualizations
MAPBOX_API_KEY = ''

DATABASE_DIALECT = os.getenv("DATABASE_DIALECT")
DATABASE_USER = os.getenv("DATABASE_USER")
DATABASE_PASSWORD = os.getenv("DATABASE_PASSWORD")
DATABASE_HOST = os.getenv("DATABASE_HOST")
DATABASE_PORT = os.getenv("DATABASE_PORT")
DATABASE_DB = os.getenv("DATABASE_DB")




SQLALCHEMY_DATABASE_URI = "%s://%s:%s@%s:%s/%s" % (
    DATABASE_DIALECT,
    DATABASE_USER,
    DATABASE_PASSWORD,
    DATABASE_HOST,
    DATABASE_PORT,
    DATABASE_DB,
)

# Don't forget copy file in Dockerfile, destination: /app/superset/static/assets/images/miracleplus-logo.png
# APP_ICON = "/static/assets/images/miracleplus-logo.png"
# APP_ICON_WIDTH = 38

LANGUAGES = {
    'en': {'flag': 'us', 'name': 'English'},
}

#TODO: Add redis cache

FEATURE_FLAGS = {
    "ENABLE_TEMPLATE_PROCESSING": True
    #Jinja SQL ：https://superset.apache.org/docs/installation/sql-templating/ 
}