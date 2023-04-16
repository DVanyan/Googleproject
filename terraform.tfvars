# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

project_id = "storied-scarab-383615"
region     = "us-central1"

resource "github_actions_secret" "GCP_SA_KEY" {
  repository       = "DVanyan/Googleproject"
  secret_name      = "GCP_SA_KEY"
  plaintext_value  = var.gcp_sa_key
}
