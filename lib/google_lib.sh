#!/bin/bash

google_create_vpc() {
# this module creates all the networking components including vpc, subnet, gateway
echo 'I can read the tenant specification'

if [ -z $GOOGLE_VPC_ID ]                    # if vpc id does not exist then ....
    then
        echo 'creating new VPC'
        echo 'the vpc cidr is ' $VPC_CIDR_BLOCK
        GOOGLE_VPC_ID=vpc-1234567890abcdef  # we simulate creation of a VPC
        echo 'GOOGLE_VPC_ID='$GOOGLE_VPC_ID >> $SCRIPT_ROOT_DIRECTORY/$TENANT_DIRECTORY/tenant_infrastructure_state.output
    fi


if [[ -z $GOOGLE_VPC_SUBNET_ID ]]
    then
        echo 'creating subnet in ' $GOOGLE_VPC_ID
        GOOGLE_VPC_SUBNET_ID=subnet-1234567890
        echo 'the subnet id is '$GOOGLE_VPC_SUBNET_ID
        echo 'GOOGLE_VPC_SUBNET_ID='$GOOGLE_VPC_SUBNET_ID >> $SCRIPT_ROOT_DIRECTORY/$TENANT_DIRECTORY/tenant_infrastructure_state.output
    fi
}
