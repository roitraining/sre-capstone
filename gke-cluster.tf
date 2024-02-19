resource "google_container_cluster" "gke-cluster" {
  name               = "${var.app_name}-cluster"
  location           = var.gcp_zone_1
  initial_node_count = 2
  deletion_protection = false

  node_config {
    machine_type = "e2-small"
    service_account = "${var.gke-node-service-account-name}@${var.project_id}.iam.gserviceaccount.com"
    spot = true
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
}
