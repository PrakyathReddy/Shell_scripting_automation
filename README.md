# Shell scripting automation

This is a shell script that connects to AWS using aws cli to retrieve list of resources in the region you specify

#### How to use this script

1. Clone this repository - $ git clone https://github.com/PrakyathReddy/Shell_scripting_automation.git
2. install aws cli - https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions
3. configure aws cli - https://docs.aws.amazon.com/cli/latest/userguide/cli-authentication-user.html
4. execute ./aws-resources-list.sh \<region\> \<resource-type\><br>
Ex: $ ./aws-resource-list.sh us-east-1 ec2 <br>
       | i-04022cfdaf0049e5b | t3.micro | running | 107.22.115.189 | 172.31.24.113  |

region can be us-east-1, ap-south-1, etc.
resource-type can be ec2, s3, ebs, etc.

#### Implementation of the script

##### Step 1: Validate the command
Make sure 2 arguments (region and resource) are provided, and also that they are valid. 

region can be us-east-1, ap-south-1, etc.
resource-type can be ec2, s3, ebs, etc.

##### Step 2: AWS integration
Every service of AWS has it's own API's. <br>
Instead of directly making API call to AWS, use the AWS CLI. Shell script will talk to AWS CLI, and AWS CLI will talk to AWS account. <br>
Similarly, for Python, we use a module called  boto3<br>
install aws cli: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html#getting-started-install-instructions<br>
configure aws cli: https://docs.aws.amazon.com/cli/latest/userguide/cli-authentication-user.html<br>
Add conditions in the script that validate if the user has installed and configured aws cli

#### Step 3: Using switch, define a command for each type of resource
List of services supported by this script: ec2, s3, rds, lambda, dynamodb, cloudformation, iam, sns, sqs, cloudwatch, eks, ebs, elb, vpc, alb
