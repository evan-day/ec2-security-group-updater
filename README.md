# AWS EC2 Security Group Updater

Changing networks quite a lot or maybe use a VPN while trying to SSH to EC2 instances? Then use this script to quickly update your IP address in your security group without needing to access the AWS Management Console!

### Requirements

* This only works with EC2-VPC Security Groups, it does not work with EC2-Classic Security Groups.
* This script assumes that you have the AWS CLI default profile configured locally with the right IAM permissions and that you have cURL installed.
* You just need to have the Group ID handy for the Security Group you want to update.

### How Does This Work

* The script determines your local, public IP address and formats it to the expected CIDR format for the EC2 command. In this case, appending /32 to the value that is returned by cURL.
* It then asks for the group ID of the security group you want to update
* It then runs an `aws ec2 authorize-security-group-ingress` command with the required flags. If it succeeds, the script just exits. If the rule already exists (if your IP address is still the same) then you will get an `InvalidPermission.Duplicate` error, but the rule will still be unchanged.

### Updates

Most likely the only update (if I have not done so already) will be to let you pick if you want to just allow SSH or All Traffic to your instance, from your machine. Apart from that, I made this quick script to just make my life a bit easier when it comes to being on the road or when I use a VPN. So once it works, it works!