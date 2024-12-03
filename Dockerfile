FROM rasa/rasa-sdk:3.5.0

# Copy actions and requirements
COPY ./actions /app/actions
COPY requirements.txt /app/requirements.txt

# Install Python dependencies
RUN python -m venv /app/venv
RUN /app/venv/bin/pip install --no-cache-dir -r /app/requirements.txt

# Set working directory
WORKDIR /app

# Command to run the action server
CMD ["/app/venv/bin/rasa", "run", "actions", "--actions", "actions.actions"]




# CMD ["rasa", "run", "actions", "--enable-api", "--port", "5055"]
