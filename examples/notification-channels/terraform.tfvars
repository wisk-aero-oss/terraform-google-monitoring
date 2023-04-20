
gcp_project = "company-monitoring"

# Lookup integration key from Pagerduty
# service_key: pagerduty:service_name:integration_summary

# Lookup secret from Google Secret Manager
#   works for all 3 sensitive_labels
# key: secret:secret_name

# How to get the mobile ones?
#   Setup via Google Cloud App
#     vivaa-staging-backend has 17

notification_channels = [
  ###---------------------
  ### email
  ###---------------------
  {
    description  = "Email"
    display_name = "user@abc.com"
    enabled      = true
    labels = {
      email_address = "user@abc.com"
    }
    type = "email"
  },

  ###---------------------
  ### PagerDuty
  ###---------------------
  #{
  #  description  = "On-call Engineering"
  #  display_name = "Engineering"
  #  enabled      = true
  #  sensitive_labels = {
  #    service_key = "pagerduty:Google Cloud Monitoring Service:Google Cloud Monitoring"
  #  }
  #  type = "pagerduty"
  #},

  ###---------------------
  ### Slack channels
  ###---------------------
  ### Testing channels
  {
    description  = "Channel for testing and debugging monitoring"
    display_name = "Testing Monitoring"
    enabled      = true
    labels = {
      channel_name = "#dev-test-webhooks"
      team         = "Company"
    }
    sensitive_labels = {
      auth_token = "secret:slack-notifications"
    }
    type = "slack"
  },
  ###---------------------
  ### SMS devices
  ###---------------------
  {
    description  = "User phone"
    display_name = "1234567890"
    enabled      = true
    labels = {
      number = "+11234567890"
    }
    type = "sms"
  },
]
