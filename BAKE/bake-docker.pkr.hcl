packer {
  required_plugins {
    docker = {
      version = ">= 0.0.7"
      source = "github.com/hashicorp/docker"
    }
  }
}

source "docker" "python_server" {
  image  = "python:latest"
  commit = true
  changes = [
    "WORKDIR /app",
    "VOLUME ./app /app",
    "EXPOSE 8080",
    "ONBUILD RUN pip install -r requirements.txt",
    "CMD [\"python3\", \"rw-env.py;\"]"
  ]
}

build {
  name    = "build-docker-trilha"
  sources = ["source.docker.python_server"]
  provisioner "shell-local" {
    inline = ["docker build -t trilhajt/pythonserver ."]
  }
}

