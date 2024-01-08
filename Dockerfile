# Use the official Superset image from Docker Hub
FROM apache/superset:2.1.3

USER root

# Install PostgreSQL driver
RUN pip install psycopg2-binary
RUN pip install python-dotenv

COPY . /app/

# Switching back to using the `superset` user
USER superset

# config file
COPY superset_config.py /app/pythonpath/superset_config.py

# Copy logo image file
COPY ./image/logo.png /app/superset/static/assets/images/miracleplus-logo.png


# Expose the Superset web port
EXPOSE 8000


# Start Superset
CMD ["superset", "run", "-p", "8000", "--with-threads", "--reload", "--no-debugger"]


