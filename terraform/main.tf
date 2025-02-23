# ========== Showroom Project ==========

resource "render_project" "showroom" {
  name = "showroom"
  environments = {
    "production" = {
      name : "production"
      protected_status : "protected"
    }
  }
}


# ========== Showroom Database ==========

resource "render_postgres" "showroom" {
  name    = "showroom-db"
  plan    = "free"
  region  = "frankfurt"
  version = "15"

  database_name = "showroom"
  database_user = "showroom"

  environment_id = render_project.showroom.environments["production"].id
}


# ========== Showroom Web Services ==========

locals {
  web_services = {
    "accounts" = {
      web_service_name     = "accounts",
      dockerhub_image_name = "accounts"
    },
    "authentication" = {
      web_service_name     = "authentication",
      dockerhub_image_name = "auth"
    },
    "gateway" = {
      web_service_name     = "gateway",
      dockerhub_image_name = "gateway"
    }
  }
}


module "web_services" {
  source               = "./modules/web_service"
  for_each             = local.web_services
  web_service_name     = each.value.web_service_name
  dockerhub_image_name = each.value.dockerhub_image_name
  dockerhub_username   = var.dockerhub_username
}
