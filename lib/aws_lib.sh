#!/bin/bash

aws_create_vpc() {
# this module creates all the networking components including vpc, subnet, gateway
echo 'I can read the tenant specification'

if [ -z $AWS_VPC_ID ]                    # if vpc id does not exist then ....
    then
        echo 'creating new VPC'
        echo 'the vpc cidr is ' $VPC_CIDR_BLOCK
        AWS_VPC_ID=vpc-1234567890abcdef  # we simulate creation of a VPC
        echo 'AWS_VPC_ID='$AWS_VPC_ID >> $SCRIPT_ROOT_DIRECTORY/$TENANT_DIRECTORY/tenant_infrastructure_state.output
    fi

    
if [[ -z $AWS_VPC_SUBNET_ID ]]
    then
        echo 'creating subnet in ' $AWS_VPC_ID
	AWS_VPC_SUBNET_ID=subnet-1234567890
        echo 'the subnet id is '$AWS_VPC_SUBNET_ID
        echo 'AWS_VPC_SUBNET_ID='$AWS_VPC_SUBNET_ID >> $SCRIPT_ROOT_DIRECTORY/$TENANT_DIRECTORY/tenant_infrastructure_state.output
    fi
}
