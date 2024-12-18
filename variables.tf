variable "project_id" {
  description = "devp_2240"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "Europe west"
}

variable "cluster_name" {
  description = "Virtualfusion GKE cluster"
  type        = string
  default     = "Virtualfusion-gke-cluster"
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
  default     = 2
}

variable "machine_type" {
  description = "Machine type for the default node pool"
  type        = string
  default     = "e2-medium"
}

variable "vpc_name" {
  description = "Name of the VPC network"
  type        = string
  default     = "VirtualfusionVPC"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "fusion-subnet"
}

variable "subnet_cidr" {
  description = "CIDR range for the subnet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "firewall_allow_ports" {
  description = "List of ports to allow in the firewall"
  type        = list(number)
  default     = [22]
}
