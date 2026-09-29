# --------------------------------------------------
# 1. EC2 instances in Singapore using for_each
# --------------------------------------------------
resource "aws_instance" "singapore_servers" {
  for_each = var.instance_configs

  ami           = var.ami_id_singapore
  instance_type = each.value.instance_type

  tags = {
    Name        = "${terraform.workspace}-${each.key}"
    Environment = terraform.workspace
    Region      = "Singapore"
  }

  lifecycle {
    create_before_destroy = true
  }
}


# --------------------------------------------------
# 2. Create 2 EC2 instances using count
# Only enabled for the selected environment
# --------------------------------------------------
resource "aws_instance" "extra_servers" {
  count = var.create_extra_instances ? 2 : 0

  ami           = var.ami_id_singapore
  instance_type = "t3.micro"

  tags = {
    Name        = "${terraform.workspace}-extra-server-${count.index + 1}"
    Environment = terraform.workspace
    Region      = "Singapore"
  }

  lifecycle {
    create_before_destroy = true
  }
}


# --------------------------------------------------
# 3. EC2 instance in Mumbai using provider alias
# --------------------------------------------------
resource "aws_instance" "mumbai_server" {
  provider = aws.mumbai

  ami           = var.ami_id_mumbai
  instance_type = "t3.micro"

  tags = {
    Name        = "${terraform.workspace}-mumbai-server"
    Environment = terraform.workspace
    Region      = "Mumbai"
  }

  lifecycle {
    create_before_destroy = true
  }
}