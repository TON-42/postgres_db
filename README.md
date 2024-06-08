# Postgres DB

This repository manages the PostgreSQL database schema using Alembic for migrations. It uses shared SQLAlchemy models from the `shared_models` repository.

## Repository Structure

```
postgres_db/
├── alembic/                    # Alembic directory for migrations
│   ├── env.py
│   ├── README
│   ├── script.py.mako
│   └── versions/               # Directory where migration scripts are stored
├── config/                     # Database configuration files
├── docker-compose.yml          # Docker setup for local development
├── init_db.sh                  # Initialization script
├── README.md                   # Documentation
├── requirements.txt            # Project dependencies
└── .env                        # Environment variables
```

## Prerequisites

1. **Clone the `shared_models` repository next to this repository**:

   ```sh
   git clone https://github.com/your-username/shared_models.git
   ```

2. **Install PostgreSQL** on your local machine. Ensure it's running.

3. **Install Docker** if you haven't already.

## Setting Up Locally

1. **Clone this repository and the shared_models repository**:

   ```sh
   git@github.com:TON-42/shared_models.git
   git@github.com:TON-42/postgres_db.git
   cd postgres_db
   ```

2. **Create a virtual environment** and activate it:

   ```sh
   python3 -m venv venv
   source venv/bin/activate
   ```

3. **Install the project dependencies**:

   ```sh
   pip install -r requirements.txt
   ```

4. **Install the shared models package**:

   ```sh
   pip install -e ../shared_models
   ```

5. **Create a `.env` file** with your PostgreSQL credentials:

   ```env
   POSTGRES_USER=myfancysecretusername
   POSTGRES_PASSWORD=mysupersecretpassword
   POSTGRES_DB=mydatabasename
   DATABASE_URL=postgresql://myfancysecretusername:mysupersecretpassword@localhost:5432/mydatabasename
   ```

6. **Start PostgreSQL with Docker**:

   ```sh
   docker-compose up -d
   ```

7. **Initialize the database**:

   ```sh
   ./init_db.sh
   ```

## Running Migrations

1. **Create a new migration**:

   ```sh
   alembic revision --autogenerate -m "Describe your changes"
   ```

2. **Apply the migration**:

   ```sh
   alembic upgrade head
   ```

## Explanation of Key Components

### `shared_models` Repository

The `shared_models` repository contains SQLAlchemy models that are used across multiple projects, such as the `quart_backend` and `postgres_db` repositories. This approach ensures consistency and maintainability of the database schema across different parts of the application.

### Alembic

Alembic is a database migration tool for SQLAlchemy. It helps manage changes to your database schema over time. By using Alembic, you can create, apply, and track database migrations, ensuring that your database schema stays synchronized with your application code.

### Environment Variables

Using environment variables helps keep sensitive information like database credentials secure and makes the configuration more flexible. The `.env` file is used to store these variables, which are then loaded into the application using `python-dotenv`.

### Docker

Docker is used to run the PostgreSQL database in a container, making it easy to set up and manage the database for local development. The `docker-compose.yml` file defines the configuration for the PostgreSQL service.

### Summary
