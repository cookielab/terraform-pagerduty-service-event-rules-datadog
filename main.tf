data "pagerduty_vendor" "datadog" {
  name = "Datadog"
}

data "pagerduty_priority" "p1" {
  name = "P1"
}

data "pagerduty_priority" "p2" {
  name = "P2"
}

data "pagerduty_priority" "p3" {
  name = "P3"
}

data "pagerduty_priority" "p4" {
  name = "P4"
}

data "pagerduty_priority" "p5" {
  name = "P5"
}

resource "pagerduty_event_orchestration_service" "datadog" {
  service                                = pagerduty_service.datadog.id
  enable_event_orchestration_for_service = var.enabled
  set {
    id = "start"
    rule {
      condition {
        expression = "event.source matches '${data.pagerduty_vendor.datadog.name}' and event.severity matches 'warning' and event.custom_details.alert_priority matches '^P(1|2)$'"
      }
      actions {
        severity = "warning"
      }
    }
    rule {
      condition {
        expression = "event.custom_details.priority matches 'normal' and event.severity matches 'error' and event.custom_details.alert_priority matches 'P1'"
      }
      actions {
        priority = data.pagerduty_priority.p1.id
        severity = "critical"
      }
    }
    rule {
      condition {
        expression = "event.custom_details.priority matches 'normal' and event.severity matches 'error' and event.custom_details.alert_priority matches 'P2'"
      }
      actions {
        priority = data.pagerduty_priority.p2.id
        severity = "error"
      }
    }
    rule {
      condition {
        expression = "event.custom_details.priority matches 'normal' and event.custom_details.alert_priority matches 'P3'"
      }
      actions {
        priority = data.pagerduty_priority.p3.id
        severity = "warning"
      }
    }
    rule {
      condition {
        expression = "event.custom_details.priority matches 'normal' and event.custom_details.alert_priority matches 'P4'"
      }
      actions {
        priority = data.pagerduty_priority.p4.id
        severity = "warning"
      }
    }
    rule {
      condition {
        expression = "event.custom_details.priority matches 'normal' and event.custom_details.alert_priority matches 'P5'"
      }
      actions {
        priority = data.pagerduty_priority.p5.id
        severity = "info"
      }
    }
  }
  catch_all {
    actions {}
  }
}
