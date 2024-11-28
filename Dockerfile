FROM python:3.9-slim

# Set environment variables to disable Jupyter's token authentication
ENV JUPYTER_TOKEN=''

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Install JupyterLab
RUN pip install --upgrade pip
RUN pip install jupyterlab

# Expose port 8888 (default for JupyterLab)
EXPOSE 8888

# Command to run JupyterLab
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
