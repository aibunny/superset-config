import os
from dotenv import load_dotenv
load_dotenv()


# Superset specific config
ROW_LIMIT = 5000

SUPERSET_SECRET_KEY= os.getenv("SUPERSET_SECRET_KEY")

SQLALCHEMY_DATABASE_URI = os.getenv("DATABASE_URL")

# Flask-WTF flag for CSRF
WTF_CSRF_ENABLED = True
# Add endpoints that need to be exempt from CSRF protection
WTF_CSRF_EXEMPT_LIST = []
# A CSRF token that expires in 1 year
WTF_CSRF_TIME_LIMIT = 60 * 60 * 24 * 365

# Set this API key to enable Mapbox visualizations
MAPBOX_API_KEY = ''