####MASTER NODE
output "master-node" {
  description = "Master node connection information"
  value = {
    public_ip  = aws_instance.kubernetes_master_node.public_ip
    public_dns = aws_instance.kubernetes_master_node.public_dns
    value      = "ubuntu"
  }

}

#### WORKER NODE
output "worker-node-public_ip" {
  description = "Worker Node Public IP"
  value       = aws_instance.kubernetes_worker_node[*].public_ip

}

output "worker-node-public-dns" {
  description = "Worker Node Public DNS"
  value       = aws_instance.kubernetes_worker_node[*].public_dns

}

output "worker_node_username" {
  description = "Worker Node Username"
  value       = "ubuntu"

}
