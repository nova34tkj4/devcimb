provider "google" {
  project     = var.project
  region      = var.region
  credentials = file("/path/to/your-service-account-key.json")
}

resource "google_compute_instance" "my_instance" {
  name         = "my-instance"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.images
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  tags = ["web", "prod"]
}
