data "pagerduty_vendor" "datadog" {
  name = "Datadog"
}

resource "pagerduty_service_event_rule" "this_warning" {
  service  = var.service_id
  position = 0 + var.rule_position_addition
  disabled = var.disabled

  conditions {
    operator = "and"

    subconditions {
      operator = "equals"
      parameter {
        path  = "source"
        value = data.pagerduty_vendor.datadog.name
      }
    }

    subconditions {
      operator = "equals"
      parameter {
        path  = "severity"
        value = "warning"
      }
    }

    subconditions {
      operator = "matches"
      parameter {
        path  = "custom_details.alert_priority"
        value = "^P(1|2)$"
      }
    }
  }

  actions {
    severity {
      value = "warning"
    }
  }
}

resource "pagerduty_service_event_rule" "this_p1" {
  service  = var.service_id
  position = 1 + var.rule_position_addition
  disabled = var.disabled

  conditions {
    operator = "and"

    subconditions {
      operator = "equals"
      parameter {
        path  = "custom_details.priority"
        value = "normal"
      }
    }

    subconditions {
      operator = "equals"
      parameter {
        path  = "severity"
        value = "error"
      }
    }

    subconditions {
      operator = "equals"
      parameter {
        path  = "custom_details.alert_priority"
        value = "P1"
      }
    }
  }

  actions {
    severity {
      value = "critical"
    }
  }

  depends_on = [
    pagerduty_service_event_rule.this_warning
  ]
}

resource "pagerduty_service_event_rule" "this_p2" {
  service  = var.service_id
  position = 2 + var.rule_position_addition
  disabled = var.disabled

  conditions {
    operator = "and"

    subconditions {
      operator = "equals"
      parameter {
        path  = "custom_details.priority"
        value = "normal"
      }
    }

    subconditions {
      operator = "equals"
      parameter {
        path  = "severity"
        value = "error"
      }
    }

    subconditions {
      operator = "equals"
      parameter {
        path  = "custom_details.alert_priority"
        value = "P2"
      }
    }
  }

  actions {
    severity {
      value = "error"
    }
  }

  depends_on = [
    pagerduty_service_event_rule.this_p1
  ]
}

resource "pagerduty_service_event_rule" "this_p3" {
  service  = var.service_id
  position = 3 + var.rule_position_addition
  disabled = var.disabled

  conditions {
    operator = "and"

    subconditions {
      operator = "equals"
      parameter {
        path  = "custom_details.priority"
        value = "normal"
      }
    }

    subconditions {
      operator = "equals"
      parameter {
        path  = "custom_details.alert_priority"
        value = "P3"
      }
    }
  }

  actions {
    severity {
      value = "warning"
    }
  }

  depends_on = [
    pagerduty_service_event_rule.this_p2
  ]
}

resource "pagerduty_service_event_rule" "this_p4" {
  service  = var.service_id
  position = 4 + var.rule_position_addition
  disabled = var.disabled

  conditions {
    operator = "and"

    subconditions {
      operator = "equals"
      parameter {
        path  = "custom_details.priority"
        value = "normal"
      }
    }

    subconditions {
      operator = "equals"
      parameter {
        path  = "custom_details.alert_priority"
        value = "P4"
      }
    }
  }

  actions {
    severity {
      value = "warning"
    }
  }

  depends_on = [
    pagerduty_service_event_rule.this_p3
  ]
}

resource "pagerduty_service_event_rule" "this_p5" {
  service  = var.service_id
  position = 5 + var.rule_position_addition
  disabled = var.disabled

  conditions {
    operator = "and"

    subconditions {
      operator = "equals"
      parameter {
        path  = "custom_details.priority"
        value = "normal"
      }
    }

    subconditions {
      operator = "equals"
      parameter {
        path  = "custom_details.alert_priority"
        value = "P5"
      }
    }
  }

  actions {
    severity {
      value = "info"
    }
  }

  depends_on = [
    pagerduty_service_event_rule.this_p4
  ]
}
