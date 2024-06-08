#!/bin/bash

# Load environment variables from .env file
source .env

# Wait for PostgreSQL to start
echo "Waiting for PostgreSQL to start..."
while ! pg_isready -h localhost -U $POSTGRES_USER -d $POSTGRES_DB; do
  sleep 1
done

# Run the Alembic migrations
echo "Running Alembic migrations..."
alembic upgrade head

echo "Database initialization complete."
