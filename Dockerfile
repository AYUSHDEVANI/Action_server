FROM rasa/rasa-sdk:latest

# Copy actions and requirements
COPY ./actions /app/actions
COPY requirements.txt requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set working directory
WORKDIR /app

# Start action server
CMD ["start", "--actions", "actions.actions"]


# CMD ["rasa", "run", "actions", "--enable-api", "--port", "5055"]
