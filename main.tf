terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = "ru-central1"
  profile = ""
  service_account_key_file = "key.json"
  folder_id = var.folder_id 

}