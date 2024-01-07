# Use the official Superset image from Docker Hub
FROM apache/superset:latest

# Set environment variables
ENV SUPERSET_SECRET_KEY=$(openssl rand -base64 42)

# Install PostgreSQL driver
RUN pip install psycopg2-binary

# Expose the Superset web port
EXPOSE 8088

# Start Superset
CMD ["superset", "run", "-p", "8088", "--with-threads", "--reload", "--no-debugger"]
