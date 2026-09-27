resource "aws_key_pair" "kubernetes_keypair" {
  key_name   = "k8s"
  public_key = file("/home/anshit/keypair/k8s/k8s-keypair.pub")

}