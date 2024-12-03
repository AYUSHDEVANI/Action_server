# Use a base image that includes Rasa SDK
FROM rasa/rasa-sdk:3.5.0

# Ensure root user is used for installation
USER root

# Upgrade pip, setuptools, wheel to avoid issues with package installations
RUN pip install --upgrade pip setuptools wheel --no-cache-dir

# Install rasa and rasa-sdk explicitly
RUN pip install rasa rasa-sdk --no-cache-dir

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt into the container
COPY requirements.txt /app/

# Install system build tools that may be required for some dependencies
RUN apt-get update && apt-get install -y build-essential

# Install the dependencies listed in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Set the command to start the Rasa action server
CMD ["rasa", "run", "--actions", "actions"]







# CMD ["rasa", "run", "actions", "--enable-api", "--port", "5055"]
