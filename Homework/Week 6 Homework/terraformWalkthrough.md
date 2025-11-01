

# Terraform Walkthrough


## Prerequistes


```
1) Must have AWS CLI Configured
2) VS Code should be installed

```

### Instructions
Step 1 - AWS credentials check
```
1) Open terminal or gitbash and run the aws sts get-caller-identity command
2) The results should output the UserID, Account and Arn information
```

Step 2 - Create directory 
```
1) Using terminal or gitbash, use the mkdir command and cd into it
```

Step 3 - Create gitignore file
```
1) In the created directory create a .gitignore file using touch .gitignore
2) Open the file and add the following:

# Local .terraform directories
**/.terraform/*


# .tfstate files
*.tfstate
*.tfstate.*

# Crash log files
crash.log
crash.*.log

# Exclude all .tfvars files, which are likely to contain sensitive data, such as
# passwords, private keys, and other secrets. These should not be part of version
# control as they are data points which are potentially sensitive and subject
# to change depending on the environment.
*.tfvars
*.tfvars.json

# Ignore override files as they are usually used to override resources locally and so
# are not checked in
override.tf
override.tf.json
*_override.tf
*_override.tf.json

# Ignore transient lock info files created by terraform apply
.terraform.tfstate.lock.info

# Include override files you do wish to add to version control using negated pattern
# !example_override.tf

# Include tfplan files to ignore the plan output of command: terraform plan -out=tfplan
# example: *tfplan*

# Ignore CLI configuration files
.terraformrc
terraform.rc

# lock files
*.terraform.lock.hcl.*
.terraform.lock.hcl

# Ignore keys
*.json 
!tests/event.json
!tests/output.json
*.pem

#ignore packages
*.rpm
rpm_packages/
*.zip

venv/
```
Step 4 - Create Terraform files
```
1) create a the following files using the touch command:
touch 0-auth.tf
touch 1-vpc.tf
touch 2-subnets.tf
touch 3-igw.tf
touch 4-nat.tf
touch 5.routetable.tf
```

Step 5 - Launch VS Code
```
1) use the command code . to launch VS Code
```

Step 6 - Set Up Terraform Project
```
1) Use Aaron's command to check AWS credentials and terraform version:
 curl https://raw.githubusercontent.com/aaron-dm-mcdonald/Class7-notes/refs/heads/main/101825/check.sh | bash
 
 
2) In your 0-auth file type:

terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.18.0"
    }
  }
}

provider "aws" {
    region = "us-east-1"
}

Feel free to replace the region's value with the region you want to work in

```

Step 7 - Working In Your Terraform Project
```
1) After setting your inital environment, follow the I(V)PAD principle
1a) In VS Code's terminal, type "terraform init"'
1b) You should see  terraform.lock.hcl and .terraform items in your file explorer

2) Type "terraform Validate".  This will ensure your syntax is correct and catch errors.
3) Type "terraform plan".  This will display the details of your changes
4) Once you are satisfied with the change, type "Terraform apply".  This will push your changes to AWS once you approve the change
5) Sign into the AWS console using the same account the CLI is using.  This will allow you to check if your cloud environment was successfully deployed
6) Type "terraform destroy" to tear down your cloud environment
```

##  Reference

Use the terraform registry for assistance in building resources:

* 
https://registry.terraform.io/providers/hashicorp/aws/latest/docs#aws-configuration-reference

