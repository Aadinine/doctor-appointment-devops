# Alternative Cloud Providers
# Uncomment one of these if Azure doesn't work

# Google Cloud Platform (requires card for verification)
# terraform {
#   required_providers {
#     google = {
#       source  = "hashicorp/google"
#       version = "~> 4.0"
#     }
#   }
# }
# provider "google" {
#   project = "your-project-id"
#   region  = "us-central1"
# }

# DigitalOcean (may accept PayPal)
# terraform {
#   required_providers {
#     digitalocean = {
#       source  = "digitalocean/digitalocean"
#       version = "~> 2.0"
#     }
#   }
# }
# provider "digitalocean" {}

# Oracle Cloud (always free tier - no card required for some services)
# terraform {
#   required_providers {
#     oci = {
#       source  = "oracle/oci"
#       version = "~> 4.0"
#     }
#   }
# }
# provider "oci" {
#   region = "us-ashburn-1"
# }
