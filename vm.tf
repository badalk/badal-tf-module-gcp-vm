data "google_compute_image" "my_image" {
  family  = "debian-9"
  project = "debian-cloud"
}

resource "google_compute_instance" "firstserver" {
  name         = "${var.serverName}"
  machine_type = "${var.nodeType}"
  zone         = "${var.zone}"


  boot_disk {
    initialize_params {
      image = "${data.google_compute_image.my_image.self_link}"
    }
  }
  network_interface {
    network = "${var.networkName}"
    subnetwork = "${var.subnetName}"

    access_config { #gets ephimeral address assigned to it
    }
  }

  metadata = {
    foo = "bar"
  }

  # metadata_startup_script = "echo hi > /test.txt"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}