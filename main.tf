# 1.Create VPC 
resource "aws_vpc" "day2_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "Day2-VPC"
  }
}

# 2. Create Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.day2_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-Subnet"
  }
}

# 3. Create Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.day2_vpc.id
  cidr_block = var.private_subnet_cidr

  tags = {
    Name = "Private-Subnet"
  }
}

# 4. Create Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.day2_vpc.id

  tags = {
    Name = "VPC-Internet-Gateway"
  }
}

# 5. Create Route Table (Public)
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.day2_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Public-Route-Table"
  }
}

# 6. Associate Route Table with Public Subnet
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# 7. Create Security Group
resource "aws_security_group" "web_sg" {
  name   = "web-sg"
  vpc_id = aws_vpc.day2_vpc.id

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Web-Security-Group"
  }
}

#8. Launch EC2 Instance
resource "aws_instance" "ec2_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "Day2-EC2"
  }
}