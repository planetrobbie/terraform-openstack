terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  user_name   = "$user_name"
  tenant_id = "$tenant_id"
  password    = "$password"
  auth_url    = "$auth_url"
  region      = "$region"
}

#resource "openstack_blockstorage_volume_v2" "vol-01" {
#  name = "$volume_name_01"
#  size = 1
#}

#resource "openstack_blockstorage_volume_v2" "vol-02" {
#  name = "$volume_name_02"
#  size = 1
#}

resource "openstack_compute_keypair_v2" "yet-keypair" {
  name       = "yet-keypair"
  public_key = "$keypair"
}

resource "openstack_compute_instance_v2" "myinstance" {
  name            = "$instance_name"
  image_id        = "$image_id"
  flavor_id       = "$flavor_id"
  key_pair        = "yet-keypair"
  security_groups = ["default"]

  network {
    name = "$network"
  }
}

#resource "openstack_compute_volume_attach_v2" "attached" {
#  instance_id = "${openstack_compute_instance_v2.myinstance.id}"
#  volume_id   = "${openstack_blockstorage_volume_v2.volume-01.id}"
#}

#resource "openstack_compute_volume_attach_v2" "attached-01" {
#  instance_id = "${openstack_compute_instance_v2.myinstance.id}"
#  volume_id   = "${openstack_blockstorage_volume_v2.vol-01.id}"
#}

#resource "openstack_compute_volume_attach_v2" "attached-02" {
#  instance_id = "${openstack_compute_instance_v2.myinstance.id}"
#  volume_id   = "${openstack_blockstorage_volume_v2.vol-02.id}"
#}
