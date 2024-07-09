import boto3

def handler(event, context):
    bucket_name = event['messages'][0]['details']['bucket_id']
    object_key = event['messages'][0]['details']['object_id']
    session = boto3.session.Session()
    s3 = session.client(
                  service_name='s3',
                  endpoint_url='https://storage.yandexcloud.net',
                  region_name='ru-central1'
                  )
    obj = s3.get_object(Bucket=bucket_name, Key=object_key)
    print(obj)
    print(obj['Body'].read().decode('utf-8'))
    return {
        'statusCode': 200,
        'body': 'Hello World!',
    }