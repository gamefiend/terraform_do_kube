# DNSimple domain configuration


# SSH Configuration


# Load Balancing
resource "digitalocean_loadbalancer" "k8s-lb" {
    name    = "k8s-nyc2"
    region  = "nyc2"

    forwarding_rule {
        entry_port = 80
        entry_protocol = "http"
        target_port = 80
        target_protocol = "http"
    }

    healthcheck {
        port = 22
        protocol = "tcp"
    }
    
    droplet_tag = "${digitalocean_tag.control.id}"
    
}


