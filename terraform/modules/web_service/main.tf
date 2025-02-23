resource "render_web_service" "free_simple" {
  name   = var.web_service_name
  plan   = "free"
  region = "frankfurt"
  runtime_source = {
    image = {
      image_url = "${var.dockerhub_username}/${var.dockerhub_image_name}"
    }
  }
}