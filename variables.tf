variable "service_id" {
  type        = string
  description = "PagerDuty service ID"
}

variable "disabled" {
  type        = bool
  description = "Disable these PagerDuty service event rules"
  default     = false
}
