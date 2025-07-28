# Use an official slim Python image
FROM python:3.9-slim-buster

# Set working directory
WORKDIR /app

# Copy only requirements first (for cache optimization)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt \
    && pip uninstall -y torch \
    && pip install torch==2.0.1+cpu -f https://download.pytorch.org/whl/torch_stable.html

# Create required directories
RUN mkdir -p input output model

# Copy the application code
COPY . .

# Download and cache SentenceTransformer model to local model directory
RUN python -c "\
from sentence_transformers import SentenceTransformer; \
SentenceTransformer('sentence-transformers/all-MiniLM-L6-v2')\
  .save('./model/all-MiniLM-L6-v2-local')"

# Default command
CMD ["python", "main.py"]
