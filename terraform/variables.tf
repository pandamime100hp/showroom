# 
# Generate a file containing the below variables locally in 
# order to apply them to the production instance. These values
# are not stored in source control. They can be found on the 
# Render dashboard.
# 


variable "render_api_key" {
  type        = string
  description = "Render API key"
  sensitive   = true
}

variable "render_owner_id" {
  type        = string
  description = "Render owner ID"
}

variable "dockerhub_username" {
  type        = string
  description = "Docker Hub username"
  default     = "pandamime100hp"
}