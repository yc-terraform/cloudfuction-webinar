resource "yandex_function_trigger" "s3function" {
  name        = "s3function"
  description = "s3function"
  function {
    id                 = yandex_function.s3function.id
    service_account_id = yandex_iam_service_account.sa.id
  }
  object_storage {
    bucket_id = yandex_storage_bucket.s3.id
    create    = true
    update    = true
    batch_cutoff = "0"
    batch_size   = "1"
  }
}