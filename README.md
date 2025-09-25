# TensorFlow GPU DevContainer 🚀

**Instant neural networks coding with GPU acceleration!**

Zero setup, maximum speed TensorFlow environment. Your friends just clone, open in VS Code, and start building neural networks immediately.

## 🏃‍♂️ For your friends (instant setup)

**One command to rule them all:**
```bash
curl -fsSL https://raw.githubusercontent.com/SnaetWarre/tf-gpu-devcontainer/master/scripts/install.sh | bash
```

Then anywhere they want to code neural networks:
```bash
newtf my-neural-project
code my-neural-project
# In VS Code: Dev Containers: Reopen in Container
```

**What they get instantly:**
- 🎯 TensorFlow 2.20+ with GPU support  
- 📊 Jupyter notebooks ready to go
- 🧠 Neural network quickstart examples
- 📦 All ML libraries: numpy, matplotlib, pandas, scipy, seaborn
- ⚡ Pre-built image pulls in seconds (no waiting for builds)

## 🔧 Manual setup (if they prefer)

**Option 1: Use this repo as template**
1. Create `.devcontainer/devcontainer.json` in any project:
```json
{
  "name": "TensorFlow GPU Dev Container",
  "image": "ghcr.io/snaetwarre/tf-gpu-dev:latest",
  "runArgs": ["--runtime", "nvidia", "--gpus", "all", "--shm-size=1g"],
  "hostRequirements": { "gpu": true }
}
```
2. Open in VS Code → Dev Containers: Reopen in Container

**Option 2: Clone this repo**
```bash
git clone https://github.com/snaetwarre/tf-gpu-devcontainer.git
cd tf-gpu-devcontainer
code .
# Dev Containers: Reopen in Container
```

## 🧠 Neural Networks Examples

The `newtf` command creates projects with `neural_networks_quickstart.ipynb` that includes:
- GPU setup verification
- Simple feedforward neural network
- Training with real-time plotting
- Prediction examples

## 💻 Requirements

**On the host machine:**
- Docker with GPU support
- VS Code + Dev Containers extension  
- NVIDIA GPU + drivers
- NVIDIA Container Toolkit: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html

**Test GPU setup:**
```bash
docker run --rm --gpus all nvidia/cuda:12.0-base-ubuntu22.04 nvidia-smi
```

## 🚀 What makes this fast?

- **Pre-built image:** No Docker builds, just pulls your ready image
- **GPU optimized:** TensorFlow + CUDA stack pre-installed  
- **Smart defaults:** Memory growth, quiet logs, essential extensions only
- **Instant scaffolding:** Neural network examples ready to run

## 🔄 For you (maintaining the image)

**Update the image:**
```bash
# Edit what you need, then:
docker build -t ghcr.io/snaetwarre/tf-gpu-dev:latest .
docker push ghcr.io/snaetwarre/tf-gpu-dev:latest
```

**Test locally:**
```bash
docker run --rm --gpus all --shm-size=1g ghcr.io/snaetwarre/tf-gpu-dev:latest \
  python -c "import tensorflow as tf; print('TF:', tf.__version__, 'GPUs:', tf.config.list_physical_devices('GPU'))"
```

---

**Ready to build the future with neural networks? Your friends are one command away from GPU-accelerated ML! 🤖⚡**