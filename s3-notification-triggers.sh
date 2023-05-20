#!/bin/bash

##############################
# Author: Nikunj Khakhkhar
# Date: 20th May 2023
#
# Version: v1
#
# This script will send email notifcation using s3 event triggering when ever a new file is uploaded
##############################

# Running script in debug mode
set -x 

# Store the AWS account ID in a Variable
aws_account_id=$(aws sts get-caller-identity --query 'Account' --output text)

# Print the AWS account ID from the variable
echo "AWS Account ID: $aws_account_id"

# Set AWS region and bucket name
aws_region="us-east-1"
bucket_name="nikunj26-s3-bucket"
lambda_function_name="s3-lambda-function"
role_name="s3-lambda-sns"
email_address="njkhakhkhar@gmail.com"

# Create IAM Role for the project
role_response=$(aws iam create-role --role-name s3-lambda-sns --assume-role-policy-document '{
    "Version": "2012-10-17",
    "Statement": [{
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
            "Service": [
                "lambda.amazonaws.com",
                "s3.amazonaws.com",
                "sns.amazonaws.com"
            ]
        }
    }]
}')

# Extract the role ARN from the JSON response and store it in a variable
role_arn=$(echo "$role_response" | jq -r '.Role.Arn')

# Print the role ARN
echo "Role ARN: $role_arn"

# Attach Permisssion to the Role
aws iam attach-role-policy --role-name $role_name --policy-arn arn:aws:iam::aws:policy/AWSLambda_FullAccess
aws iam attach-role-policy --role-name $role_name --policy-arn arn:aws:iam::aws:policy/AmazonSNSFullAccess

# Create the S3 Bucket and capture the output in a variable
bucket_output=$(aws s3api create-bucket --bucket "$bucket_name" --region "$aws_region")

# Print the output from the variable
echo "Bucket creation output: $bucket_output"