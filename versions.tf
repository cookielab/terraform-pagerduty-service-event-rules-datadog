terraform {
  required_version = ">= 1.0, < 2.0"

  required_providers {
    pagerduty = {
      source  = "PagerDuty/pagerduty"
      version = ">= 2.4.2"
    }
  }
}
