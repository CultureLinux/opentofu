terraform {
    required_providers {
        ovh = {
            source = "ovh/ovh"
            version = ">= 0.43.1"
        }
    }
}

#export OVH_ENDPOINT="ovh-eu"
#export OVH_APPLICATION_KEY="xxxxxxxxxxxxxxxxxxx"
#export OVH_APPLICATION_SECRET="xxxxxxxxxxxxxxxxxxx"
#export OVH_CONSUMER_KEY="xxxxxxxxxxxxxxxxxxx"

# Or 

provider "ovh" {
  endpoint           = "ovh-eu"
  application_key    = "xxxxxxxxxxxxxxxxxxx"
  application_secret = "xxxxxxxxxxxxxxxxxxx"
  consumer_key       = "xxxxxxxxxxxxxxxxxxx"
}