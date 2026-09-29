# Current Terraform workspace
output "workspace_name" {
  description = "Current Terraform workspace"
  value       = terraform.workspace
}

# Singapore instance IDs
output "singapore_instance_ids" {
  description = "EC2 instance IDs in Singapore"

  value = {
    for name, instance in aws_instance.singapore_servers :
    name => instance.id
  }
}

# Singapore public IPs
output "singapore_public_ips" {
  description = "Public IPs of EC2 instances in Singapore"

  value = {
    for name, instance in aws_instance.singapore_servers :
    name => instance.public_ip
  }
}

# Extra instance IDs created using count
output "extra_instance_ids" {
  description = "Instance IDs created using count"
  value       = aws_instance.extra_servers[*].id
}

# Extra instance public IPs
output "extra_public_ips" {
  description = "Public IPs of instances created using count"
  value       = aws_instance.extra_servers[*].public_ip
}

# Mumbai instance ID
output "mumbai_instance_id" {
  description = "EC2 instance ID in Mumbai"
  value       = aws_instance.mumbai_server.id
}

# Mumbai public IP
output "mumbai_public_ip" {
  description = "Public IP of EC2 instance in Mumbai"
  value       = aws_instance.mumbai_server.public_ip
}

# Deployment regions
output "deployment_regions" {
  description = "AWS regions used for deployment"

  value = {
    singapore = "ap-southeast-1"
    mumbai    = "ap-south-1"
  }
}