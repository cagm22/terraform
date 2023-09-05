## Example of Terraform configuration file with docker provider.



terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pulls the image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Create a container
resource "docker_container" "container" {
  image = docker_image.nginx.image_id
  name  = "nginx"
  ports {
    internal="80"
    external="80"
}
}
