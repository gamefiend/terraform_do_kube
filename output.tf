output "control_public_address" {
    value = ["${digitalocean_droplet.k8s-control.*.ipv4_address}"]
}

output "control_private_address" {
    value = ["${digitalocean_droplet.k8s-control.*.ipv4_address_private}"]
}

output "worker_public_address" {
    value = ["${digitalocean_droplet.k8s-worker.*.ipv4_address}"]
}

output "lb_ip" {
    value = "${digitalocean_loadbalancer.k8s-lb.ip}"
}

