#!/bin/bash

create_vpc() {
echo 'I can read the tennant specification'

if [ -z $EC2_VPC_ID ]
    then
        echo 'creating new VPC'
        echo 'the vpc cidr is ' $VPC_CIDR_BLOCK
        EC2_VPC_ID=vpc-1234567890abcdef
        echo 'EC2_VPC_ID='$EC2_VPC_ID >> $SCRIPT_ROOT_DIRECTORY/$TENANT_ENV_VARIABLE_SPECIFICATION/config_resulting_state.output
    fi

    
if [[ -z $EC2_VPC_SUBNET_ID ]]
    then
        echo 'creating subnet in ' $EC2_VPC_ID
	EC2_VPC_SUBNET_ID=subnet-1234567890
        echo 'the subnet id is '$EC2_VPC_SUBNET_ID
        echo 'EC2_VPC_SUBNET_ID='$EC2_VPC_SUBNET_ID >> $SCRIPT_ROOT_DIRECTORY/$TENANT_ENV_VARIABLE_SPECIFICATION/config_resulting_state.output
    fi
}
