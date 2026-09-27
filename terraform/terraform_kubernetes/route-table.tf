###Route Tables
resource "aws_route_table" "k8s_master_rt" {
  vpc_id = aws_vpc.k8s_master_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.k8s_master_igw.id
  }

  route {
    cidr_block                = aws_vpc.k8s_worker_vpc.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
  }

  tags = {
    Name = "Master-RT"
  }
}

resource "aws_route_table" "k8s_worker_rt" {
  vpc_id = aws_vpc.k8s_worker_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.k8s_worker_igw.id
  }

  route {
    cidr_block                = aws_vpc.k8s_master_vpc.cidr_block
    vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
  }

  tags = {
    Name = "Worker-RT"
  }

}

###Route Table Associations
resource "aws_route_table_association" "master_subnet_asssociation" {
  subnet_id      = aws_subnet.k8s_master_sb.id
  route_table_id = aws_route_table.k8s_master_rt.id

}

resource "aws_route_table_association" "worker_subnet_association" {
  subnet_id      = aws_subnet.k8s_worker_sb.id
  route_table_id = aws_route_table.k8s_worker_rt.id

}
