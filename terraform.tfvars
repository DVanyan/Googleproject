region          = "us-east1"
gcp_project     = "storied-scarab-383615"
credentials     = "credentials.json"
name            = "dev"
subnet_cidr     = "10.10.0.0/24"

resource "github_actions_secret" "gcp_sa_key" {
  repository       = "DVanyan/Googleproject"
  secret_name      = "GCP_SA_KEY"
  plaintext_value  = var.gcp_sa_key.gcp_sa_key
}