# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

resource "github_actions_secret" "GCP_SA_KEY" {
  repository       = "DVanyan/Googleproject@main"
  secret_name      = "GCP_SA_KEY"
  plaintext_value  = var.gcp_sa_key
}


provider "google" {
  project = var.project_id
  region  = var.region
}

# VPC
resource "google_compute_network" "vpc" {
  name                    = "${var.project_id}-vpc"
  auto_create_subnetworks = "false"
  credentials             = var.gcp_sa_key
}

# Subnet
resource "google_compute_subnetwork" "subnet" {
  name          = "${var.project_id}-subnet"
  region        = var.region
  network       = google_compute_network.vpc.name
  ip_cidr_range = "10.10.0.0/24"
  credentials   = var.gcp_sa_key
}
