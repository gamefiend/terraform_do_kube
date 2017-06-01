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

    connection {
        type = "ssh"
        private_key = "${file("${var.private_key}")}"
        user = "root"
        timeout = "2m"
    }

    provisioner "remote-exec" {
        inline = [
            "DD_API_KEY=0e5ef0a9e997a54de4ac5e9c968256e6 bash -c \"$(curl -L https://raw.githubusercontent.com/DataDog/dd-agent/master/packaging/datadog-agent/source/install_agent.sh)\""
            ]
        }

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

    connection {
        type = "ssh"
        private_key = "${file("${var.private_key}")}"
        user = "root"
        timeout = "2m"
    }

    provisioner "remote-exec" {
        inline = [
            "DD_API_KEY=0e5ef0a9e997a54de4ac5e9c968256e6 bash -c \"$(curl -L https://raw.githubusercontent.com/DataDog/dd-agent/master/packaging/datadog-agent/source/install_agent.sh)\""
            ]
        }

}

