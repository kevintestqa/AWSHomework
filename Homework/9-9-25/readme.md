# How To Configure EC2

Follow these steps to configure and launch an EC2 instance in AWS:

---

## 1. Create a Security Group
1. In the AWS Console, search for **EC2**.
2. On the left-hand side, click **Security Groups**.
3. Click **Create security group** (orange button).
4. Give it a name and description.
5. Under **Inbound rules**, click **Add rule**:
   - **Type:** HTTP  
   - **Port range:** 80  
   - **Source:** Anywhere (0.0.0.0/0, ::/0)  
6. Leave **Outbound rules** as default.  
7. (Optional) Add tags.  
8. Click **Create security group**.

---

## 2. Launch an Instance
1. In the EC2 console, click **Instances** → **Launch instances**.
2. Enter a name for your instance.
3. Leave the AMI as **Amazon Linux** (default free tier).
4. Leave the default instance type.
5. Under **Key pair**:
   - Create a new key pair.  
   - Choose **RSA** as the key type.  
   - Leave `.pem` as the file format.  
   - Download the key pair file.  

---

## 3. Configure Networking
1. Under **Network Settings**, select **Select existing security group**.
2. Choose the security group you just created.

---

## 4. Add User Data (Optional)
1. Expand **Advanced details**.
2. Scroll to **User data**.
3. Paste in your EC2 startup script.

---

## 5. Launch & Test
1. Click **Launch instance**.
2. Wait until the status is **Running** and health checks pass.
3. Copy the **Public DNS** of your instance.
4. Open a browser and visit:  
