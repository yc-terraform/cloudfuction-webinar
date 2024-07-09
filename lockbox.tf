resource "yandex_lockbox_secret" "creds" {
  name = "creds"
  folder_id = var.folder_id 
}

resource "yandex_lockbox_secret_version" "secret-key" {
  secret_id = yandex_lockbox_secret.creds.id
  entries {
    key        = "secret_key"
    text_value = yandex_iam_service_account_static_access_key.sa-static.secret_key
  }
   entries {
    key        = "access_key"
    text_value = yandex_iam_service_account_static_access_key.sa-static.access_key
   }
   entries {
    key        = "region"
    text_value = "ru-central1"
  }
}
