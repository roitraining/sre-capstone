resource "kubernetes_job" "db-init-job" {
  depends_on = [helm_release.database-server-mariadb]

  metadata {
    name = "db-init-job"
    labels = {
      App = "events-db-init-job"
    }
    namespace = kubernetes_namespace.events_ns.metadata[0].name
  }

  spec {
    template {
      metadata {}
      spec {
        container {
          image   = var.db-init_image_name
          name  = "db-init"
          env {
            name  = "GOOGLE_CLOUD_PROJECT"
            value = var.project_id
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


        }
        restart_policy = "Never"
      }
    }
    backoff_limit = 4
  }
  wait_for_completion = true
}
