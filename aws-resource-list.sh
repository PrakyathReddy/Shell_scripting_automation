#!/bin/bash
# shebang is used to specify the script interpreter

################################################################################
# this script will list all AWS resources in the specified region
# Author: PrakyathReddy

# Services that are supported by the script:
# 1. ec2
# 2. s3
# 3. rds
# 4. lambda
# 5. dynamodb
# 6. cloudformation
# 7. iam
# 8. sns
# 9. sqs
# 10. cloudwatch
# 11. eks
# 12. ebs
# 13. elb
# 14. vpc
# 15. alb
#
# Usage: ./aws-resources-list.sh <region> <resource-type>
################################################################################

# Check if the required number of arguments are passed
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <region> <resource-type>"
    exit 1
fi
# $0 is the script name; -ne means "not equal to"; $# is the number of arguments passed; Exit 1 means exit with error code 1. Error code 1 means general error

# check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI not found. Please install AWS CLI to use this script."
    exit 1
fi

# check if AWS CLI is configured
if [ ! -d "$HOME/.aws" ]; then
    echo "AWS is not configured. Please configure AWS CLI to use this script."
    exit 1
fi

# for each resource type, we will use the appropriate AWS CLI command to list the resources
REGION=$1
RESOURCE_TYPE=$2
case $RESOURCE_TYPE in
    ec2)
        aws ec2 describe-instances --region $REGION --query 'Reservations[*].Instances[*].[InstanceId,InstanceType,State.Name,PublicIpAddress,PrivateIpAddress]' --output table
        ;;
    s3)
        aws s3api list-buckets --query 'Buckets[*].[Name,CreationDate]' --output table
        ;;
    rds)
        aws rds describe-db-instances --region $REGION --query 'DBInstances[*].[DBInstanceIdentifier,DBInstanceClass,Engine,DBInstanceStatus,Endpoint.Address]' --output table
        ;;
    lambda)
        aws lambda list-functions --region $REGION --query 'Functions[*].[FunctionName,Runtime,Handler,LastModified]' --output table
        ;;
    dynamodb)
        aws dynamodb list-tables --region $REGION --query 'TableNames' --output table
        ;;
    cloudformation)
        aws cloudformation describe-stacks --region $REGION --query 'Stacks[*].[StackName,StackStatus,CreationTime]' --output table
        ;;
    iam)
        aws iam list-users --query 'Users[*].[UserName,UserId,CreateDate]' --output table
        ;;
    sns)
        aws sns list-topics --region $REGION --query 'Topics[*].TopicArn' --output table
        ;;
    sqs)
        aws sqs list-queues --region $REGION --query 'QueueUrls' --output table
        ;;
    cloudwatch)
        aws cloudwatch describe-alarms --region $REGION --query 'MetricAlarms[*].[AlarmName,StateValue,MetricName,Namespace]' --output table
        ;;
    eks)
        aws eks list-clusters --region $REGION --query 'clusters' --output table
        ;;
    ebs)
        aws ec2 describe-volumes --region $REGION --query 'Volumes[*].[VolumeId,Size,State,SnapshotId]' --output table
        ;;
    elb)
        aws elb describe-load-balancers --region $REGION --query 'LoadBalancerDescriptions[*].[LoadBalancerName,DNSName,Scheme]' --output table
        ;;
    vpc)
        aws ec2 describe-vpcs --region $REGION --query 'Vpcs[*].[VpcId,CidrBlock,State]' --output table
        ;;
    alb)
        aws elbv2 describe-load-balancers --region $REGION --query 'LoadBalancers[*].[LoadBalancerName,DNSName,Type]' --output table
        ;;
    *)
        echo "Unsupported resource type: $RESOURCE_TYPE"
        echo "Supported resource types: ec2, s3, rds, lambda, dynamodb, cloudformation, iam, sns, sqs, cloudwatch, eks, ebs, elb, vpc, alb"
        exit 1
        ;;
esac        

