# Use a lightweight Python base image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    build-essential \
    libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy the requirements file
COPY requirements.txt /app/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files
COPY . /app/

# Expose the Rasa SDK port
EXPOSE 5055

# Command to run the Rasa SDK server
CMD ["rasa-sdk", "--actions", "actions"]






# CMD ["rasa", "run", "actions", "--enable-api", "--port", "5055"]
