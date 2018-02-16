#!/bin/bash

stackName=$1

aws cloudformation create-stack --stack-name $stackName --template-body file://csye6225-cf-application.json \
  --parameters ParameterKey=DBName,ParameterValue=csye6225 \
  ParameterKey=DBUser,ParameterValue=csye6225master \
  ParameterKey=DBPassword,ParameterValue=csye6225password \
  ParameterKey=bucketName,ParameterValue=s3.nvncloud.me
  # ParameterKey=DBSecurityGroup,ParameterValue=sg-de6036a9 \
  # ParameterKey=DBSubnetGroupName,ParameterValue=netstack-nvndbsubnetgroup-61ortlga93wb


  # "DBSubnetGroupName": {
  #   "Description": "Subnet group name",
  #   "Type": "String"
  # },
  # "DBSecurityGroup":{
  #   "Description": "Security group",
  #   "Type": "String"
  # },

  # "DBSecurityGroups": [{
  #   "Ref": "DBSecurityGroup"
  # }],
  # "DBSubnetGroupName": {
  #   "Ref": "DBSubnetGroupName"
  # }

# Assignment 4
# InstanceName=$1
# InstanceId=`aws ec2 run-instances --cli-input-json file://csye6225-cf-application.json --query Instances[*][InstanceId] --output text`
# aws ec2 create-tags --resources $InstanceId --tags Key=Name,Value=$InstanceName
#
# InstanceState=""
#
# until [ "$InstanceState" = "running" ]; do
#   InstanceState=`aws ec2 describe-instance-status --query 'InstanceStatuses[?InstanceId==\`'$InstanceId'\`][InstanceState][*][Name]' --output text`
#   echo $InstanceState
#   sleep 20
# done
#
# echo "$InstanceName ec2 instance is up & running!!!!"
