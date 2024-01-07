# Use the official Superset image from Docker Hub
FROM apache/superset:latest

# Install PostgreSQL driver
RUN pip install psycopg2-binary

# Expose the Superset web port
EXPOSE 8088

# Start Superset
CMD ["superset", "run", "-p", "8088", "--with-threads", "--reload", "--no-debugger"]
