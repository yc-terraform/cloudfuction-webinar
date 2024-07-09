resource "yandex_storage_bucket" "s3" {
  bucket = "s3-function-test"
  access_key = yandex_iam_service_account_static_access_key.sa-static.access_key
  secret_key = yandex_iam_service_account_static_access_key.sa-static.secret_key
  grant {
    id          = yandex_iam_service_account.sa.id
    type        = "CanonicalUser"
    permissions = ["READ", "WRITE"]
  }
}