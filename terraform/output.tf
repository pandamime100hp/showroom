output "postgres_connection_string" {
  value     = render_postgres.showroom.connection_info
  sensitive = true
}