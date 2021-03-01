variable "instance_name" {
  description = "name of instance"
  default = "instance-01"
}

variable "user_name" {
  description = "OpenStack user"
}

variable "password" {
  description = "OpenStack pwd"
}

variable "auth_url" {
  description = "OpenStack Auth URL"
  default = "https://auth.cloud.ovh.net/v3/"
}

variable "tenant_name" {
  description = "OpenStack tenant name"
}

variable "region" {
  description = "OpenStack region targeted"
  default = "BHS5"
}

variable  "keypair" {
  description = "OpenStack public key to inject"
}

variable  "image_id" {
  description = "OpenStack Image ID to provision"
}

variable  "flavor_id" {
  description = "OpenStack Flavor ID"
}