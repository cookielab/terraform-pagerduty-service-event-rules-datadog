variable "service_id" {
  type = string
  description = "PagerDuty service ID"
}

variable "rule_position_addition" {
  type = number
  description = "PagerDuty service event rule popsition addition eg. for P1 `position = 0 + rule_position_addition`"
  default = 0
}

variable "disabled" {
  type = bool
  description = "Disable these PagerDuty service event rules"
  default = false
}
