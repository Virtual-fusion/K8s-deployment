resource "google_container_cluster" "Virtualfusion-GKE-cluster1" {
  name     = var.cluster_name
  location = var.region

  initial_node_count = var.node_count

  node_config {
    machine_type = var.machine_type
  }

  # Enable basic add-ons
  addons_config {
    http_load_balancing {
      disabled = false
    }
  }
}

output "kubeconfig" {
  value = google_container_cluster.primary.endpoint
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}

resource "google_compute_network" "vpc" {
  name = var.vpc_name
  auto_create_subnetworks = true 
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  network       = google_compute_network.vpc.id
  region        = var.region
}

resource "google_compute_firewall" "allow" {
  name    = "allow-ssh"
  network = google_compute_network.vpc.id

  allow {
    protocol = "tcp"
    ports    = var.firewall_allow_ports
  }

  source_ranges = ["0.0.0.0/0"] # Open to all IPs (for public access)
  description   = "Allow SSH traffic"
}
