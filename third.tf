#VPC teste
provider "google" {
  project = "pro-lattice-368817"
  region  = "us-west4"
  zone    = "us-west4-a"
}

variable "nome" {
  type = string
  default = terceiro
}

# VPC
resource "google_compute_network" "vpc2" {
  name                    =  var.nome    #${{ env.VPCNAME }}
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnet" {
  name          = "sub-rede"
  region        = "us-west4"
  network       = google_compute_network.vpc.name
  ip_cidr_range = "192.168.0.0/24"
}
