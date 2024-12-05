FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy requirements.txt into the container
COPY requirements.txt /app/

# Install dependencies
RUN pip install --upgrade pip setuptools wheel --no-cache-dir && \
    pip install -r requirements.txt --no-cache-dir

# Explicitly install rasa-sdk
RUN pip install rasa-sdk==3.6.2 --no-cache-dir

# Symlink rasa-sdk binary to ensure it's in the PATH
RUN ln -s $(pip show rasa-sdk | grep Location | awk '{print $2}')/rasa_sdk /usr/local/bin/rasa-sdk

# Copy the application code
COPY . /app/

# Start the Rasa action server
CMD ["rasa-sdk", "--actions", "actions"]








# CMD ["rasa", "run", "actions", "--enable-api", "--port", "5055"]
