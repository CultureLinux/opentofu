terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
  }
  required_version = ">= 0.13"
}

# Create API KEY here  https://console.scaleway.com/iam/api-keys

#export SCW_ACCESS_KEY="access key"
#export SCW_SECRET_KEY="secret key"