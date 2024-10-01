
# Stage 1: Build stage
FROM python:3.10-slim AS build

# Set work directory
WORKDIR /app

# Install dependencies required to build the app
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential gcc libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Install pipenv for managing Python dependencies
RUN pip install --no-cache-dir pipenv

# Copy Pipfile and Pipfile.lock to the container
COPY Pipfile Pipfile.lock /app/

# Install dependencies
RUN pipenv install --deploy --ignore-pipfile

# Copy the rest of the application code to the container
COPY . /app/

# Stage 2: Production stage
FROM python:3.10-slim AS production

# Set work directory
WORKDIR /app

# Install runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq-dev curl \
    && rm -rf /var/lib/apt/lists/*

# Copy installed packages from the build stage
COPY --from=build /usr/local/lib/python3.10 /usr/local/lib/python3.10
COPY --from=build /app /app

# Expose port 8000
EXPOSE 8000

# Command to run the application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "video_downloader.wsgi:application"]
