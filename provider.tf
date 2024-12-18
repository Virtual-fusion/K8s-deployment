terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.14.0"
    }
  }
}

provider "google" {
  # Configuration options
    project = "devp_2240"
  region = "Europe west"
  credentials = GCP_SERVICE_ACCOUNT_KEY ("gcp_key.json")
}