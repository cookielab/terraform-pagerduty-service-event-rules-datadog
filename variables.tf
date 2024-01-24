variable "service_id" {
  type        = string
  description = "PagerDuty service ID"
}

variable "enabled" {
  type        = bool
  description = "Enable PagerDuty event orchestration service"
  default     = true
}
