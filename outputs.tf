output "ec2_public_ip" {
  value       = aws_instance.web_server.public_ip
  description = "IP Public của EC2 dùng để SSH nếu cần"
}