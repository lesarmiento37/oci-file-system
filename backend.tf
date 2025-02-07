#terraform {
  #backend "s3" {
    #bucket    = "terraform-states-20250206-2147-leonardo-bucket"
#
    #key       = "leonardo-filesystem/terraform.tfstate"
#
    #region   = "us-phoenix-1"
    #endpoint = "https://ax2w5fadcgcx.compat.objectstorage.us-phoenix-1.oraclecloud.com"
#
    #skip_region_validation      = true
    #skip_credentials_validation = true
    #skip_metadata_api_check     = true
    #force_path_style            = true
  #}
#}
