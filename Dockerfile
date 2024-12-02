# Dockerfile for Action Server
FROM rasa/rasa-sdk:latest

# Copy actions.py into the container
COPY actions.py /app/actions.py

# Expose the default Action Server port
EXPOSE 5055

# Run the Action Server
CMD ["run", "actions", "--enable-api", "--port", "5055"]
