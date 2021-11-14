# VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id
  availability_zone = "ap-northeast-1a"
  cidr_block        = "10.0.1.0/24"
}

# IGW
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "default public gateway"
  }
}

# Default route table
resource "aws_default_route_table" "public" {
  default_route_table_id = aws_vpc.main.default_route_table_id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.igw.id
      ipv6_cidr_block            = ""
      egress_only_gateway_id     = ""
      destination_prefix_list_id = ""
      instance_id                = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
      network_interface_id       = ""
      nat_gateway_id             = ""
    }
  ]
}

# Security Group
resource "aws_security_group" "allow_ssh" {
  name        = "allow-ssh"
  description = "Allow ssh into instance"
  vpc_id      = aws_vpc.main.id

  ingress = [
    {
      description      = "Allow ssh"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [aws_vpc.main.cidr_block]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [
    {
      description      = "Allow all"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
}

resource "aws_security_group" "allow_minecraft_port" {
  name        = "allow_minecraft_port"
  description = "Allow the port that minecraft connects to, which is 25565"
  vpc_id      = aws_vpc.main.id

  ingress = [
    {
      description      = "Allow minecraft"
      from_port        = 25565 # Port ranges from
      to_port          = 25565 # Port ranges to
      protocol         = "tcp"
      cidr_blocks      = [aws_vpc.main.cidr_block]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [
    {
      description      = "Allow all"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
}

# AWS Key Pair
resource "aws_key_pair" "justin_exa_laptop" {
  key_name   = "justin_exa_laptop"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCm71dbM8Py5ieOuUwDDmnoR1B0P9twYZeQ8YR3GYbVfSIXJ0PjXP2zViXs6O4jQnqs8e5wbzPPGVgdrCvWYl+mZqhSlBfueCxDGOfn0ajbuepJ/Yuwke9iS9/4a9dzyC0OclT/UZ5oTS50NUOuijLpmFNadNiCyQ9JqIC3NWBshHTgUf8yumgfOQKLsTY6q5mYE4WxhKnVbJ/4sFtsjJRNKSjXK4R5clAFm09AjHsv8QRPVJmyCk4pCT0jCpugCl2Wz/CAYIHTxVvjzG0fj5BH/EAm+xfZOz2VpheI56ZtuAgKHjwo8PFXm/uBrXLXnEx6dKXUzfoQyepk4bZ7qil6gw5QDP2hXJY64acHic/E7pColDAMuI6PYFno4x0FtOBLOWz5K/FEP/2QBdGqg5BS8YNBBByPyM9RBIGyOSA8l0eR5b1kMExl9DhEYLqoLPlFzpj4+A4tXXICm4SJcSZ4UpuDXM7F10hcHnL0GJZlW2CHdqGubRjJrcSeR/EDuEE= jerwei.yeoh@ew0mcdev158"
}

# EC2
resource "aws_instance" "minecraft" {
  ami           = "ami-036d0684fc96830ca"
  instance_type = "t2.small"
  key_name      = aws_key_pair.justin_exa_laptop.id
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [
    aws_security_group.allow_minecraft_port.id,
    aws_security_group.allow_ssh.id
  ]

  tags = {
    Name = "minecraft server"
  }

  root_block_device {
    delete_on_termination = false
    volume_size           = 16

    tags = {
      name = "minecraft_main_storage"
    }
  }
}