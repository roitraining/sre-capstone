resource "kubernetes_deployment" "events-internal-deployment" {
  depends_on = [kubernetes_job.db-init-job]

  metadata {
    name = "events-internal-deployment"
    labels = {
      App = "events-internal"
    }
    namespace = kubernetes_namespace.events_ns.metadata[0].name
  }

  spec {
    replicas                  = 1
    progress_deadline_seconds = 300
    selector {
      match_labels = {
        App = "events-internal"
      }
    }
    template {
      metadata {
        labels = {
          App = "events-internal"
        }
      }
      spec {
        container {
          image = var.internal_image_name
          name  = "events-internal"

          env {
            name  = "GOOGLE_CLOUD_PROJECT"
            value = var.project_id
          }


          env {
            name  = "SERVICE_PORT"
            value = 8082
          }


          env {
            name  = "DBHOST"
            value = "database-server-mariadb"
          }

          env {
            name  = "DBUSER"
            value = "root"
          }

          env {
            name  = "DBPASSWORD"
            value_from {
              secret_key_ref {
                name = "database-server-mariadb"
                key  = "mariadb-root-password"
              }
            }
          }

          env {
            name  = "DBDATABASE"
            value = "events_db"
          }
          port {
            container_port = 8082
          }

          resources {
            limits = {
              cpu    = "0.2"
              memory = "256Mi"
            }
          }
        }
      }
    }
  }
}
