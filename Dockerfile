# Use a supported Python base image
FROM python:3.10-slim-bullseye

# Install system dependencies (git, ffmpeg, etc.)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git ffmpeg && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements and install Python deps
COPY requirements.txt .
RUN pip install --no-cache-dir -U pip && pip install --no-cache-dir -r requirements.txt

# Copy project code
COPY . .

# Expose port (needed if running webhook/server mode)
EXPOSE 5000

# Run your bot
CMD ["python", "bot.py"]
