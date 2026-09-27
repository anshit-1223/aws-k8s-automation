variable "k8s_ami" {
  type = string
}

variable "k8s_instance_type" {
  type = string

}

variable "k8s_instance_size" {
  type = number

}

variable "worker_count" {
  type = number

}

variable "aws_region" {
  description = "AWS Region"
  type        = string
}