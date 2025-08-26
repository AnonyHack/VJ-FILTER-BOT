# Don't Remove Credit @VJ_Botz
# Subscribe YouTube Channel For Amazing Bot @Tech_VJ
# Ask Doubt on telegram @KingVJ01

# Use a maintained base image
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

# Copy project
COPY . .

# Default command
CMD ["python", "bot.py"]

