variable "config_context" {}
variable "config_path" {}

provider "kubernetes" {
  config_path    = var.config_path
  config_context = var.config_context
}


resource "kubernetes_manifest" "hello-world-namespace" {
  manifest = yamldecode(file("../kubernetes/hello-world-namespace.yml"))
}

resource "kubernetes_manifest" "hello-world-deployment" {
  manifest = yamldecode(file("../kubernetes/hello-world-deployment.yml"))
}

resource "kubernetes_manifest" "hello-world-loadbalancer" {
  manifest = yamldecode(file("../kubernetes/hello-world-loadbalancer.yml"))
}
