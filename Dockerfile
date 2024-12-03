FROM rasa/rasa-sdk:latest

# Copy actions directory and requirements
COPY ./actions /app/actions
COPY requirements.txt requirements.txt

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set working directory
WORKDIR /app

# Command to run the action server
CMD ["rasa", "run", "actions", "--actions", "actions.actions"]



# CMD ["rasa", "run", "actions", "--enable-api", "--port", "5055"]
