resource "aws_vpc_peering_connection" "vpc_peering" {
  vpc_id      = aws_vpc.k8s_master_vpc.id
  peer_vpc_id = aws_vpc.k8s_worker_vpc.id
  auto_accept = true

  tags = {
    Name = "Master-VPC-Peering-Worker-VPC"
  }

}

# resource "aws_vpc_peering_connection" "worker_to_master_vpc" {
#   vpc_id = aws_vpc.k8s_worker_vpc.id
#   peer_vpc_id = aws_vpc.k8s_master_vpc.id
#   auto_accept = true

#   tags = {
#     Name = "Accepter-VPC-Worker"
#   }
# }       