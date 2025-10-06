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