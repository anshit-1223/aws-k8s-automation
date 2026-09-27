resource "aws_internet_gateway" "k8s_master_igw" {
  vpc_id = aws_vpc.k8s_master_vpc.id

  tags = {
    Name = "Master-IGW"
  }
}

resource "aws_internet_gateway" "k8s_worker_igw" {
  vpc_id = aws_vpc.k8s_worker_vpc.id

  tags = {
    Name = "Worker-IGW"
  }

}