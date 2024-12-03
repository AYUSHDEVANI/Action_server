FROM rasa/rasa-sdk:3.5.0

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3-dev \
    gcc \
    && apt-get clean

# Upgrade pip and setuptools
RUN python -m pip install --no-cache-dir --upgrade pip setuptools wheel

# Set working directory
WORKDIR /app

# Copy application files
COPY ./actions /app/actions
COPY requirements.txt /app/requirements.txt

# Pre-install fire and other dependencies
RUN pip install --no-cache-dir fire
RUN pip install --no-cache-dir -r requirements.txt

# Run action server
CMD ["rasa", "run", "actions", "--actions", "actions.actions"]




# CMD ["rasa", "run", "actions", "--enable-api", "--port", "5055"]
