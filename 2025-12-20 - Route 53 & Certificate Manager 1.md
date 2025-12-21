
Homework == repo of notes and terraform code with updated infrastructure to build both an HTTP and HTTPS web application.

### - Goal create HTTPs and HTTP   web apps

- HTTPS uses port 443

### AWS Certificate manager
- AWS managed service that creates and updates certificates for a specified domain
	- DNS is the phonebook of the internet
		- Translates domain names to IP addresses
		- Route 53 is the service that handles DNS queries

### Route 53 Routing types/ Health Checks
- Weighted = percentage of traffic is sent to the appropriate destination
- Latency = traffic is sent to the destination that has the lowest latency
- failover - traffic is rerouted to another AZ/region in the event an AZ/region fails
- Geolocation = traffic is routed to the nearest physical AZ
## Steps:
1. Make sure ASG is running 
2. Navigate to the Route 53 Page (Global service)
3. To register a domain navigate to the register domain and enter desired domain https://d32ze2gidvkk54.cloudfront.net/Amazon_Route_53_Domain_Registration_Pricing_20140731.pdf
	1. Name servers are associated with the domain
4. After creating the domain navigate to Hosted Zone 
	1. Make sure the Name Server in Hosted Zone **Matches** the name servers in the register domain
	2. Hosted zones hold the domain name you want to route traffic for
		1. Select public hosted and then create the Hosted Zone
5. Navigate to the Certificate manager page (Region locked)
	1. Create a public certificate
	2. Enter domain name from step 3
	3. Leave Disable export selected
	4. Validation Method - leave as default
	5. key algorithm = leave as default
	6. tags = leave as default
6. Navigate to ACM > Certificates > click on Create record in Route 53
7. Create Security group for HTTPS infrastructure 
	1. create inbound rules for SSH and HTTPS and HTTP
8. Edit load balancer inbound rules to be able to talk to port 443 in addition to port 80
9. create new launch template for HTTPS Ec2 - make sure to add it to the 443 security group
10. Create a new target group for the HTTPS infrastructure 
	1. leave protocol and health check for HTTP
		1. This is behind the load balancer hence no need to specific port 443
11. Edit existing load balancer WHEN certificate from step 5 is issued
	1. Add an HTTPS listener
	2. Target group will be the 443 group
	3. Default ssl/tsl = select From ACM
12. Create NEW ASG for 443 Launch template / application
	1. Use private subnets
	2. attach it to the 443 target group/ load balancer
	3. select target tracking scaling policy
13. Create a Simple A Record
	1. ensure to select A record
	2. value/route traffic to = Select Alias to app load balancer
