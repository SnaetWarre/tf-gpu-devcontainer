FROM tensorflow/tensorflow:latest-gpu-jupyter

ENV PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    TF_CPP_MIN_LOG_LEVEL=2

# Install TF CUDA extras and common ML libraries
RUN python -m pip install --upgrade pip && \
    pip install --no-cache-dir --upgrade --upgrade-strategy only-if-needed \
      "tensorflow[and-cuda]==2.20.*" \
      ipykernel matplotlib seaborn pandas scipy

WORKDIR /workspaces