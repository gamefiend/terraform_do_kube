# Digital Ocean configuration

# api_servers 

resource "digitalocean_droplet" "k8s-control" {
    count = 3
    image  = "debian-8-x64"
    name   = "control-${count.index + 1}"
    region = "nyc2"
    size   = "512mb"
    private_networking = true
    ssh_keys    = [9532945]
    tags    = ["${digitalocean_tag.kubernetes.id}","${digitalocean_tag.control.id}"]
}

# worker nodes

resource "digitalocean_droplet" "k8s-worker" {
    count   = 3
    image   = "debian-8-x64"
    name    = "worker-${count.index + 1 }"
    region  = "nyc2"
    size    = "512mb"
    private_networking = true
    ssh_keys    = [9532945]
    tags    = ["${digitalocean_tag.kubernetes.id}","${digitalocean_tag.worker.id}"]
}

