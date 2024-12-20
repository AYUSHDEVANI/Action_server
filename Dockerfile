FROM python:3.8-slim

# Use Rasa base image
FROM rasa/rasa:3.0.0

# Set working directory
WORKDIR /app

# Copy the Rasa directory into the container
COPY ./app/rasa /app/rasa




# Copy the Flask app directory into the container
COPY ./actions /actions
USER root

# Install Python dependencies for Flask
RUN pip install --upgrade pip
RUN pip install -r /requirements.txt


USER rasa

# Expose ports for Rasa and Flask
EXPOSE 5055

# Command to run Rasa and Flask simultaneously (or adjust as needed)
# CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "5005"]

# COPY ./app/start.sh /app/start.sh
# RUN chmod +x /app/start.sh
CMD ["rasa", "run", "actions"]



# CMD ["rasa", "run", "actions", "--enable-api", "--port", "5055"]
