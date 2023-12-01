resource "helm_release" "database-server-mariadb" {
  depends_on = [google_container_cluster.gke-cluster]

  name       = "database-server-mariadb"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "mariadb"
  namespace = kubernetes_namespace.events_ns.metadata[0].name

}