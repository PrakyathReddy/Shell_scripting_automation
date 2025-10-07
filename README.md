# Shell scripting automation

I have created a shell script where I will connect to AWS to to pull and list active resources of services.

#### Steps to make use of the script

1. Clone this repository - $ git clone https://github.com/PrakyathReddy/Shell_scripting_automation.git
2. execute ./aws-resources-list.sh \<region\> \<resource-type\>

region can be us-east-1, ap-south-1, etc.
resource-type can be ec2, s3, ebs, etc.

#### Implementation of the script

##### Step 1: Validate the command
Make sure 2 arguments (region and resource) are provided, and also that they are valid. 

region can be us-east-1, ap-south-1, etc.
resource-type can be ec2, s3, ebs, etc.

##### Step 2: AWS integration
Every service of AWS has it's own API's.
Instead of directly making API call to AWS, use the AWs CLI. Shell script will talk to AWS CLI, and AWS CLI will talk to AWS account. 
Similarly, for Python, we use a module called  boto3

