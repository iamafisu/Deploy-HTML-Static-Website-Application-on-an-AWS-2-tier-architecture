# Deploy a 2-tier HTML/Static Website Application

## 1. Deploying from a GitHub Repository.

```
## Description

The Web Server Deployment Script automates the process of setting up a web server on a Linux-based system. It installs Apache HTTP Server (httpd) and deploys a web application from a specified GitHub repository. The script is written in Bash and designed to run on a Linux system with `yum` package manager.

## Prerequisites

Before running this script, you need the following resources setup and running:

1. VPC and attach an Internet Gateway
2. 1 Public and 1 Private Subnet in 2 Availability Zones
3. Create a NAT-Gateway in the public subnet in each AZ.
3. Create Route Tables to direct traffic to internet from both the public and private subnet.
4. Create 3 Security Groups - Webserver_sg, SSH_sg and ALB_sg.
5. AWS EC2 instance running with Amazon Linux 2 in the private subnet in both AZ and the attach the Webserver_sg.
6. Create a Target Group and add the EC2 instances.
7. Create an Application Load Balancer (ALB) and point it to the Target Group.
8. Register or use an existing domain name in Route 53 and point it to the ALB DNS Name.
9. Request for SSL certificate from the Certificate Manager to secure communication to the website.
10. Done, Enjoy 

## Installation and Usage

1. Download the deployment script to your Linux system:
   ```bash
   wget https://raw.githubusercontent.com/yourusername/your-repo-name/main/script-to-deploy-from-GitHub.sh
   ```

2. Make the script executable:
   ```bash
   chmod +x script-to-deploy-from-GitHub.sh
   ```

3. Execute the script with superuser privileges:
   ```bash
   sudo ./script-to-deploy-from-GitHub.sh
   ```

## Script Steps

1. Update the package index on the system:
   ```bash
   yum update -y
   ```

2. Install Apache HTTP Server (httpd):
   ```bash
   yum install -y httpd
   ```

3. Navigate to the web root directory:
   ```bash
   cd /var/www/html
   ```

4. Download the web application files from the specified GitHub repository:
   ```bash
   wget https://github.com/iamafisu/xmen-webfiles/archive/refs/heads/main.zip
   ```

5. Unzip the web application files:
   ```bash
   unzip main.zip
   ```

6. Move the web application files to the web root directory:
   ```bash
   cp -r xmen-webfiles-main/xmen-main/* /var/www/html/
   ```

7. Clean up - remove unnecessary files and directories:
   ```bash
   rm -rf xmen-webfiles-main main.zip
   ```

8. Enable the httpd service to start on boot:
   ```bash
   systemctl enable httpd
   ```

9. Start the httpd service:
   ```bash
   systemctl start httpd
   ```

## License

This project is licensed under the MIT License.
```

For any questions or inquiries, please contact afisu.g@hotmail.com. Happy coding!
