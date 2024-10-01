# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Set environment variables for Python and Django
ENV PYTHONDONTWRITEBYTECODE=1  # Prevents Python from writing .pyc files to disk
ENV PYTHONUNBUFFERED=1  # Ensures that the Python output is sent straight to the terminal (e.g., for logging)
ENV DJANGO_ENV=production  # Environment variable for Django settings

# Set work directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libpq-dev \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install pipenv to manage dependencies more efficiently
RUN pip install --no-cache-dir pipenv

# Copy the Pipfile and Pipfile.lock to the container
COPY Pipfile Pipfile.lock /app/

# Install Python dependencies via Pipenv
RUN pipenv install --system --deploy --ignore-pipfile

# Copy the Django project files to the container
COPY . /app/

# Expose the port that the Django app will be served on
EXPOSE 8000

# Collect static files for production
RUN python manage.py collectstatic --noinput

# Set proper file permissions to avoid permission issues in containers
RUN adduser --disabled-password --gecos '' appuser && chown -R appuser /app
USER appuser

# Start the Django app using gunicorn in production mode
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "--workers", "3", "video_downloader.wsgi:application"]

