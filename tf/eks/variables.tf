variable "name" {
  description = "The name of the service and task definition"
  default     = "church-calendar-api"
}

variable "zone" {
  description = "The route53 zone for the A and AAAA entries"
}

variable "hostname" {
  description = "The hostname in the zone for the A and AAAA entries in the zone"
  default     = "calendar"
}

variable "autoscaling_range" {
  description = "A min and max number of tasks (autoscaled by CPU usage)"
  default     = [1, 1]
}

variable "docker_repo" {
  description = "The docker repo for the task definition"
  default     = "sourceandsummit/church-calendar-api"
}

variable "docker_tag" {
  description = "The docker tag for the task definition"
  default     = "latest"
}

variable "namespace" {
  description = "The namespace: staging, production, etc."
}

variable "change_cause" {
  default = null
}
