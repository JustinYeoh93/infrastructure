# EC2 IP address
output "server_public_ip" {
  value       = aws_instance.minecraft.public_ip
  sensitive   = false
  description = "Minecraft server's public IP"
}

