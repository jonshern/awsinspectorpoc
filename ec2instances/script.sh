sudo yum update -y
sudo yum install -y awslogs

# edit the file 
#  /etc/awslogs/awscli.conf 
#region = us-east-1
#aws_access_key_id = <YOUR ACCESS KEY>
#aws_secret_access_key = <YOUR SECRET KEY>

sudo service awslogs start
sudo chkconfig awslogs on

# http://docs.aws.amazon.com/inspector/latest/userguide/inspector_agents-on-linux.html

wget https://d1wk0tztpsntt1.cloudfront.net/linux/latest/install
sudo bash install
sudo /etc/init.d/awsagent start
sudo /opt/aws/awsagent/bin/awsagent status
