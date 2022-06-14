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
    "ENTRYPOINT python3 /app/rw-envs.py"
  ]
}

build {
  name    = "build-docker-trilha"
  sources = ["source.docker.python_server"]
  provisioner "file" {
    source = "./app"
    destination = "/app/"
  }
  provisioner "shell" {
    inline = ["pip install -r /app/requirements.txt"]
  }
  provisioner "shell" {
    inline = ["chmod a+x /app/rw-envs.py"]
  }
    post-processor "docker-tag" {
    repository = "trilhajt/pythonserver"
    tag        = ["1.0"]
  }
}

