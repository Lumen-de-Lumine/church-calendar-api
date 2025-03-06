module "app" {
  source = "git::https://gitlab.com/5stones/tf-modules//k8s/app?ref=v8.1.1"

  namespace    = var.namespace
  name         = var.name
  image        = "${var.docker_repo}:${var.docker_tag}"
  arch         = ["amd64", "arm64"]
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
    capabilities = {
      # ruby needs some, but maybe not all of these permissions
      add = [
        "AUDIT_WRITE",
        "CHOWN",
        "DAC_OVERRIDE",
        "FOWNER",
        "FSETID",
        "KILL",
        "MKNOD",
        "NET_BIND_SERVICE",
        "SETFCAP",
        "SETGID",
        "SETPCAP",
        "SETUID",
        "SYS_CHROOT",
      ]
    }
  }
}
