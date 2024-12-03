# Use a base image that includes Rasa SDK
FROM rasa/rasa-sdk:3.5.0

# Ensure root user is used for installation
USER root

# Upgrade pip and setuptools to avoid deprecated warnings
RUN pip install --upgrade pip setuptools --no-cache-dir

# Install rasa-sdk explicitly if it's not part of the base image
RUN pip install rasa-sdk --no-cache-dir

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt into the container
COPY requirements.txt /app/

# Install the dependencies listed in requirements.txt
RUN pip install -r requirements.txt --no-cache-dir

# Copy the rest of the application code into the container
COPY . /app/

# Set the command to start the Rasa action server
CMD ["rasa", "run", "--actions", "actions"]







# CMD ["rasa", "run", "actions", "--enable-api", "--port", "5055"]
