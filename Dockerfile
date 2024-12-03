# Use the official Rasa SDK image
FROM rasa/rasa-sdk:latest

# Copy actions into the container
COPY ./actions /app/actions

# Install dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Set the working directory
WORKDIR /app

# Command to run the action server
CMD ["start", "--actions", "actions.actions"]

# CMD ["rasa", "run", "actions", "--enable-api", "--port", "5055"]
