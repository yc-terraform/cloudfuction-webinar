resource "yandex_iam_service_account" "sa" {
  name        = "s3-function"
  description = "s3-function"
  folder_id = var.folder_id
}
resource "yandex_resourcemanager_folder_iam_binding" "sa-function" {
  folder_id = var.folder_id

  role = "functions.functionInvoker"

  members = [
    "serviceAccount:${yandex_iam_service_account.sa.id}",
  ]
}
resource "yandex_resourcemanager_folder_iam_binding" "sa-editor" {
  folder_id = var.folder_id

  role = "storage.editor"

  members = [
    "serviceAccount:${yandex_iam_service_account.sa.id}",
  ]
}

resource "yandex_resourcemanager_folder_iam_binding" "sa-serverless" {
  folder_id = var.folder_id

  role = "serverless.functions.invoker"

  members = [
    "serviceAccount:${yandex_iam_service_account.sa.id}",
  ]
}

resource "yandex_resourcemanager_folder_iam_binding" "sa-lockbox" {
  folder_id = var.folder_id

  role = "lockbox.payloadViewer"

  members = [
    "serviceAccount:${yandex_iam_service_account.sa.id}",
  ]
}

resource "yandex_resourcemanager_folder_iam_binding" "sa-kms" {
  folder_id = var.folder_id

  role = "kms.keys.encrypterDecrypter"

  members = [
    "serviceAccount:${yandex_iam_service_account.sa.id}",
  ]
}

resource "yandex_iam_service_account_static_access_key" "sa-static" {
  service_account_id = var.service_account
  description        = "static access key for object storage"
}