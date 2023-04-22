terraform {
  cloud {
    organization = "DavidGoogleProject"

    workspaces {
      name = "david-test"
    }
  }
}
// Configure the Google Cloud provider

// Create VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.name}-vpc"
  auto_create_subnetworks = "false"
}

// Create Subnet
resource "google_compute_subnetwork" "subnet" {
  depends_on = [
    google_compute_network.vpc
  ]

  name          = "${var.name}-subnet"
  ip_cidr_range = var.subnet_cidr
  network       = "${var.name}-vpc"
  region        = var.region
}
// VPC firewall configuration
resource "google_compute_firewall" "firewall" {
  depends_on = [
    google_compute_subnetwork.subnet
  ]
  name    = "${var.name}-firewall"
  network = google_compute_network.vpc.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
