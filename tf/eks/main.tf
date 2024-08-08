module "app" {
  source = "git::https://gitlab.com/5stones/tf-modules//k8s/app?ref=v6.2.0"

  namespace    = var.namespace
  name         = var.name
  image        = "${var.docker_repo}:${var.docker_tag}"
  change_cause = var.change_cause
  port         = 80
  ingress_host = "${var.hostname}.${var.zone}"

  autoscaling_range = var.autoscaling_range
  resources = {
    requests = {
      cpu    = "256m"
      memory = "128Mi"
    }
    limits = {
      memory = "1024Mi"
    }
  }

  probe_path = "/"

  security_context = {
    run_as_non_root = false
  }
}
