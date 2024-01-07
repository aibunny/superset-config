# Use the official Superset image from Docker Hub
FROM apache/superset:2.1.3

USER root

# Install PostgreSQL driver
RUN pip install psycopg2-binary
RUN pip install python-dotenv
RUN pip install --no-cache -r /app/requirements.txt
ENV REQUIREMENTS_LOCAL=/app/requirements.txt

COPY . /app/
ENV SUPERSET_CONFIG_PATH /app/superset_config.py

# Expose the Superset web port
EXPOSE 8000

# Switching back to using the `superset` user
USER superset

# Start Superset
CMD ["superset", "run", "-p", "8000", "--with-threads", "--reload", "--no-debugger"]


