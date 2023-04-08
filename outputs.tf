output "public_ip" {
  value = aws_instance.app.public_ip
}

output "gunicorn_log_file" {
  value = "/var/log/gunicorn.log"
}

output "nginx_access_log_file" {
  value = "/var/log/nginx/access.log"
}

output "nginx_error_log_file" {
  value = "/var/log/nginx/error.log"
}
