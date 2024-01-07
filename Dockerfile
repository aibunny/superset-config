# Use the official Superset image from Docker Hub
FROM apache/superset:latest

# Install PostgreSQL driver
RUN pip install psycopg2-binary
RUN pip install python-dotenv

COPY --chown=superset superset_config.py /app/
ENV SUPERSET_CONFIG_PATH /app/superset_config.py

# Expose the Superset web port
EXPOSE 8000

# Start Superset
CMD ["superset", "run", "-p", "8000", "--with-threads", "--reload", "--no-debugger"]
