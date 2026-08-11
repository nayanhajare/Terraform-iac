variable "nics" {
}

variable "lb_backend_pool_ids" {
  description = "A map of load balancer backend pool IDs to associate with the VM NICs"
  type        = map(string)
  default     = {}
}