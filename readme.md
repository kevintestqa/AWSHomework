How To Configure EC2


In the AWS console search for Ec2
On the left hand side of the page, click on Security Groups
Click on the Orange “Create security group” button
Name your security group and add a description
Under Inbound rules, click on the “Add rule” button
Add the following rules
Type = HTTP
Port range = 0
Source = “Anywhere-IPv4”
Leave Outbound rules alone
Optional - Add a tag
Click on the orange “Create security group” button.  You should see a green banner notifying you that the instance was successfully created
Navigate back to the EC2 home page and click on Instances on the left hand side
Click on the orange “Launch instances” button
Give your instance a name
Leave Amazon Linux as the AMI
Leave the instance type (it defaults to the free tier)
Create a new key pair
Leave RSA as the key pair type
Leave .pem as the private key file format
Click on the orange “Create key pair” button
Under Network Settings click on “Select existing security group” and select the security group created in step 9
Open the Advanced Details section
Scroll until you see “User data”
Paste in an EC2 start up script
Click on “Launch instance” and navigate back to the Instances page
Once the instance has been launched with the “Running” status and the health checks were successful, open the instance’s details
Copy the Public DNS
Open a new browser or tab and type http://<PublicDNS> 
