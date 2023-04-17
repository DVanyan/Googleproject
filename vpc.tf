# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "github_actions_secret" "GCP_SA_KEY" {
  repository       = "git@github.com:DVanyan/Googleproject@main"
  secret_name      = "GCP_SA_KEY"
  plaintext_value  = var.gcp_sa_key
}


provider "google" {
version = "3.5.0"
credentials = var.gcp_sa_key
project = "storied-scarab-383615"
region = "us-central1"
zone = "us-central1-c"
}
resource "google_compute_network" "vpc_network" {
name = "terraform-network"
}
resource "google_compute_subnetwork" "public-subnetwork" {
name = "terraform-subnetwork"
ip_cidr_range = "10.2.0.0/16"
region = "us-central1"
network = google_compute_network.vpc_network.name
}