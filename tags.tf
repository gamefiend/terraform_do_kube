# DigitalOcean Tags

resource "digitalocean_tag" "kubernetes" {
    name = "k8s"
}

resource "digitalocean_tag" "control" {
    name = "control"
}

resource "digitalocean_tag" "worker" {
    name = "worker"
}

resource "digitalocean_tag" "loadbalancer" {
    name = "lb"
}
