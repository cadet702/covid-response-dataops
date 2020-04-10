output "tap_covid19_summary" { value = module.tap_covid19.summary }
module "tap_covid19" {
  # BOILERPLATE HEADER (NO NEED TO CHANGE):
  source        = "git::https://github.com/slalom-ggp/dataops-infra//catalog/aws/singer-taps?ref=master"
  name_prefix   = "${local.name_prefix}tap01-"
  resource_tags = local.resource_tags
  environment   = module.env.environment

  # ADD OR MODIFY CONFIGURATION HERE:

  local_metadata_path     = "../data/taps"
  data_lake_type          = "S3"
  data_lake_metadata_path = "s3://${module.data_lake.s3_metadata_bucket}"
  data_lake_storage_path  = "s3://${module.data_lake.s3_data_bucket}/data/raw"
  scheduled_timezone      = "PDT"
  scheduled_sync_times    = ["0900"]
  taps = [
    {
      id = "covid-19"
      settings = {
        start_date = "2019-01-00T00:00:00Z"
      }
      secrets = {
        api_token  = "../data/taps/.secrets/tap-covid-19-config.json:api_token"
        user_agent = "../data/taps/.secrets/tap-covid-19-config.json:user_agent"
      }
    }
  ]
}
