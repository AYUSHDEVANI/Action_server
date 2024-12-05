# Use a lightweight Python base image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file to the container
COPY requirements.txt /app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Expose the port your Flask app or Rasa SDK uses (update if different)
EXPOSE 5005

# Set environment variables (optional, if needed)
ENV PYTHONUNBUFFERED=1

# Command to run the Rasa SDK
CMD ["rasa-sdk", "--actions", "actions"]








# CMD ["rasa", "run", "actions", "--enable-api", "--port", "5055"]
