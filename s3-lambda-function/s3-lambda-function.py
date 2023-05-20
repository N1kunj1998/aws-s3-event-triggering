import boto3
client = boto3.client('sns')

def lambda_handler(event, context):
    object_key = event['Records'][0]['s3']['object']['key']
    bucket_name = event['Records'][0]['s3']['bucket']['name']
    topic_arn = 'arn:aws:sns:us-east-1:695223721867:s3-lambda-sns'
    message = 'new file created ' + object_key + ' in ' + bucket_name
    subject = 'S3 object created'
    client.publish(TopicArn=topic_arn,Message=message,Subject=subject)