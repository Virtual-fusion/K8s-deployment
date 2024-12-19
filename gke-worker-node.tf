resource "google_container_cluster" "MYK8s" {
  name     = var.cluster_name
  location = var.region
  network  = google_compute_network.vpc.id
  subnetwork = google_compute_subnetwork.subnet.id

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
