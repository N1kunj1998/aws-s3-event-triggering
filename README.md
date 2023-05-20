# aws-s3-event-triggering

## Description
The S3 Event Triggering Shell Scripting Project automates actions when a file is added to an S3 bucket. An S3 event triggers an AWS Lambda function, which executes a shell script using assigned IAM roles. After processing the file, the Lambda function can send an email notification via SNS. This project provides a scalable and efficient solution for handling file uploads and notifying users in real-time.

## installation
you need to have aws cli installed in your system

### jq installation
you will need to have jq in your system 

**For mac**
```brew install jq```

**For Linux**
```sudo apt-get install jq```

## Changes in s3-notification-triggers.sh

### s3 bucket name
you will have to change **bucket_name** and it should be globally unique

### email 
you will have to change **email_address** field