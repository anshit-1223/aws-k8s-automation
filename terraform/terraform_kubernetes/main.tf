resource "aws_instance" "kubernetes_master_node" {
  ami                         = var.k8s_ami
  key_name                    = aws_key_pair.kubernetes_keypair.key_name
  instance_type               = var.k8s_instance_type
  vpc_security_group_ids      = [aws_security_group.k8s_master_sg.id]
  subnet_id                   = aws_subnet.k8s_master_sb.id
  user_data                   = file("master.sh")
  associate_public_ip_address = true
  user_data_replace_on_change = true

  depends_on = [
    aws_route_table_association.master_subnet_asssociation
  ]
  root_block_device {
    volume_size = var.k8s_instance_size
    volume_type = "gp3"
  }

  tags = {
    Name = "Master-Node"
  }

}

resource "aws_instance" "kubernetes_worker_node" {
  count                  = var.worker_count
  ami                    = var.k8s_ami
  key_name               = aws_key_pair.kubernetes_keypair.key_name
  instance_type          = var.k8s_instance_type
  vpc_security_group_ids = [aws_security_group.k8s_worker_sg.id]
  subnet_id              = aws_subnet.k8s_worker_sb.id
  # user_data                   = file("worker.sh")
  user_data = templatefile("${path.module}/worker.sh", {
    hostname = "worker-node${count.index + 1}"
  })
  associate_public_ip_address = true
  user_data_replace_on_change = true
  depends_on = [
    aws_route_table_association.worker_subnet_association
  ]

  root_block_device {
    volume_size = var.k8s_instance_size
    volume_type = "gp3"
  }

  tags = {
    Name = "Worker-Node-${count.index + 1}"
  }

}

