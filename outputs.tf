output "instance_ip_addr" {
    value = "${google_compute_instance.firstserver.network_interface.0.network_ip}"
    description = "The private IP address of the GCE instance."

}
output "external_ip_addr" {
    value = "${google_compute_instance.firstserver.network_interface.0.access_config.0.nat_ip}"
    description = "The private IP address of the GCE instance."

}
