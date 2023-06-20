/**
 * # Example: Project Audit Logs
 *
 */

module "project_audit_logs" {
  source = "../.."

  audit_configs = [
    {
      audit_log_configs = [
        { log_type = "ADMIN_READ" }
      ]
      service = "allServices"
    },
    {
      audit_log_configs = [
        { log_type = "ADMIN_READ" },
        { log_type = "DATA_READ" },
        { log_type = "DATA_WRITE" }
      ]
      service = "accessapproval.googleapis.com"
    },
    {
      audit_log_configs = [
        { log_type = "ADMIN_READ" },
        { log_type = "DATA_READ" },
        { log_type = "DATA_WRITE" }
      ],
      service = "apigateway.googleapis.com"
    },
    {
      audit_log_configs = [
        { log_type = "ADMIN_READ" },
        { log_type = "DATA_READ" },
        { log_type = "DATA_WRITE" }
      ],
      service = "bigtable.googleapis.com"
    },
    {
      audit_log_configs = [
        { log_type = "ADMIN_READ" },
        { log_type = "DATA_READ" },
        { log_type = "DATA_WRITE" }
      ],
      service = "cloudsql.googleapis.com"
    },
    {
      audit_log_configs = [
        { log_type = "ADMIN_READ" },
        { log_type = "DATA_READ" },
        { log_type = "DATA_WRITE" }
      ],
      service = "compute.googleapis.com"
    },
    {
      audit_log_configs = [
        { log_type = "ADMIN_READ" },
        { log_type = "DATA_READ" },
        { log_type = "DATA_WRITE" }
      ],
      service = "container.googleapis.com"
    },
    {
      audit_log_configs = [
        { log_type = "ADMIN_READ" },
        { log_type = "DATA_READ" },
        { log_type = "DATA_WRITE" }
      ],
      service = "datastore.googleapis.com"
    },
    {
      audit_log_configs = [
        { log_type = "ADMIN_READ" },
        { log_type = "DATA_READ" },
        { log_type = "DATA_WRITE" }
      ],
      service = "gkebackup.googleapis.com"
    },
    {
      audit_log_configs = [
        { log_type = "ADMIN_READ" },
        { log_type = "DATA_READ" },
        { log_type = "DATA_WRITE" }
      ],
      service = "iam.googleapis.com"
    },
    {
      audit_log_configs = [
        { log_type = "ADMIN_READ" },
        { log_type = "DATA_READ" },
        { log_type = "DATA_WRITE" }
      ],
      service = "logging.googleapis.com"
    },
    {
      audit_log_configs = [
        { log_type = "ADMIN_READ" },
        { log_type = "DATA_READ" },
        { log_type = "DATA_WRITE" }
      ],
      service = "secretmanager.googleapis.com"
    },
    {
      audit_log_configs = [
        { log_type = "ADMIN_READ" },
        { log_type = "DATA_READ" },
        { log_type = "DATA_WRITE" }
      ],
      service = "vpcaccess.googleapis.com"
    }
  ]
  target_id   = var.target_id
  target_type = "project"
}
