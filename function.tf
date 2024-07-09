resource "yandex_function" "s3function" {
    name               = "s3function"
    description        = "s3function"
    user_hash          = "first-function"
    runtime            = "python37"
    entrypoint         = "index.handler"
    memory             = "128"
    execution_timeout  = "10"
    service_account_id = yandex_iam_service_account.sa.id
    content {
        zip_filename = "function.zip"
    }
    secrets {
        id                   =  yandex_lockbox_secret.creds.id
        version_id           =  yandex_lockbox_secret_version.secret-key.id
        key                  = "access_key"
        environment_variable = "AWS_ACCESS_KEY_ID"
  }
    secrets {
        id                   =  yandex_lockbox_secret.creds.id
        version_id           =  yandex_lockbox_secret_version.secret-key.id
        key                  = "secret_key"
        environment_variable = "AWS_SECRET_ACCESS_KEY"
  }
    secrets {
        id                   =  yandex_lockbox_secret.creds.id
        version_id           =  yandex_lockbox_secret_version.secret-key.id
        key                  = "region"
        environment_variable = "AWS_DEFAULT_REGION"
  }
}
 