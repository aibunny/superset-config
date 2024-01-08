# Use the official Superset image from Docker Hub
FROM apache/superset:2.1.3

# Switching to root to install additional dependencies
USER root

# Install PostgreSQL driver
RUN pip install psycopg2-binary gunicorn python-dotenv gevent

# Switching back to using the `superset` user
USER superset

# Copying additional files and configurations
COPY .env /app/pythonpath/.env

# Adding your custom Superset configuration
COPY superset_config.py /app/pythonpath/superset_config.py


# Copy logo image file
COPY ./image/logo.webp /app/superset/static/assets/images/logo.webp

