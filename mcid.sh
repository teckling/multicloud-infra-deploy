#!/bin/bash
export SCRIPT_ROOT_DIRECTORY=$(cd ${0%/*} && pwd -L )

# mcid.sh will call on the modules in these libraries to create infrastructure components in various clouds.
source $SCRIPT_ROOT_DIRECTORY/lib/aws_lib.sh
source $SCRIPT_ROOT_DIRECTORY/lib/azure_lib.sh
source $SCRIPT_ROOT_DIRECTORY/lib/google_lib.sh
source $SCRIPT_ROOT_DIRECTORY/lib/alibaba_lib.sh
source $SCRIPT_ROOT_DIRECTORY/lib/oracle_lib.sh

# Here is the simple instruction on how to use mcid.sh
# you should create a subfolder config/<PRODUCT>/<CLOUD>/<REGION>/<TENANT> e.g. app01/azure/west-europe/customer05
# then create tenant_infrastructure_specification.input and provide your infrastructure specification
# then you can just run ./mcid.sh app01 azure west-europe customer05
# the infrastructure will be created according to the specification

# For each customer or tenant, we create a sub-folder to store their configuration and state details
PRODUCT=$1
CLOUD=$2
REGION=$3
TENANT=$4
MODE=$5
TENANT_DIRECTORY=config/$1/$2/$3/$4

# For each tenant, you must explicitly provide the infrastructure specification that you wish to deploy in this file
source $SCRIPT_ROOT_DIRECTORY/$TENANT_DIRECTORY/tenant_infrastructure_specification.input

# For each tenant, the deployed infrastructure details like vpd id, instance size etc are stored in this file
touch $SCRIPT_ROOT_DIRECTORY/$TENANT_DIRECTORY/tenant_infrastructure_state.output
source $SCRIPT_ROOT_DIRECTORY/$TENANT_DIRECTORY/tenant_infrastructure_state.output

# start deployment
echo 'deploying infrastructure specified in' $SCRIPT_ROOT_DIRECTORY/$TENANT_DIRECTORY/tenant_infrastructure_specification.input
cat $SCRIPT_ROOT_DIRECTORY/$TENANT_DIRECTORY/tenant_infrastructure_specification.input

case $CLOUD in
aws)
  aws_create_vpc;;
azure)
  azure_create_vnet;;
google)
  google_create_vpc;;
alibaba)
  commands;;
oracle)
  commands;;
esac
