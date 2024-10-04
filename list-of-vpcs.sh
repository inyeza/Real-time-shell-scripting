#!/bin/bash
# this script list all the vpcs in our aws account

if [ $# -gt 0 ]; then
    aws --version
    if [ $? -eq 0 ]; then
        REGION=$@
        for region in $REGION; do
            echo "Listing VPCs in region $region"
            aws ec2 describe-vpcs --region $region --query "Vpcs[*].{VpcId:VpcId}" --output table
        done
    else
        echo "AWS CLI is not installed"
    fi
else
    echo "Please provide a region as an argument"
fi
