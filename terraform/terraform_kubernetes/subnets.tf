##Subnets
resource "aws_subnet" "k8s_master_sb" {
  vpc_id                  = aws_vpc.k8s_master_vpc.id
  cidr_block              = "10.1.1.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Master Subnet"
  }
}

resource "aws_subnet" "k8s_worker_sb" {
  vpc_id                  = aws_vpc.k8s_worker_vpc.id
  cidr_block              = "10.2.1.0/24"
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Worker Subnet"
  }
}

