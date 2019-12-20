sourceIPAddress=$(curl -s ifconfig.me)
formattedAddress="${sourceIPAddress}/32"
echo "The IP Address to add to your Security Group is $formattedAddress"
read -p "Enter the group ID of the Security Group to update: " securityGroupID
echo "Updating the specified Security Group. This will fail if the rule already exists but we dont need to worry about that"
aws ec2 authorize-security-group-ingress --group-id $securityGroupID  --protocol tcp --port 22 --cidr $formattedAddress