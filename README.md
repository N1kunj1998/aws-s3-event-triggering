# aws-s3-event-triggering

!["Workflow image"](https://drive.google.com/file/d/1FYqnfhgk44gaDFmVxUkjMh8-VDGJtZ0z/preview)

## Description
The S3 Event Triggering Shell Scripting Project automates actions when a file is added to an S3 bucket. An S3 event triggers an AWS Lambda function, which executes a shell script using assigned IAM roles. After processing the file, the Lambda function can send an email notification via SNS. This project provides a scalable and efficient solution for handling file uploads and notifying users in real-time.

## Installation
you need to have aws cli installed in your system

### jq installation
you will need to have jq in your system 

**For mac**
```brew install jq```

**For Linux**
```sudo apt-get install jq```

### boto installation
```pip install boto3``` \ ```pip3 install boto3```

## Changes in s3-notification-triggers.sh

### s3 bucket name
you will have to change **bucket_name** and it should be globally unique

### email 
you will have to change **email_address** field

## Instructions
make sure to have you aws cli default region same as you are specifying in the shell script