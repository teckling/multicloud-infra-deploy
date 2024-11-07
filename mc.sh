#!/bin/bash
export SCRIPT_ROOT_DIRECTORY=$(cd ${0%/*} && pwd -L )

source $SCRIPT_ROOT_DIRECTORY/lib/aws_lib.sh
source $SCRIPT_ROOT_DIRECTORY/lib/azure_lib.sh
source $SCRIPT_ROOT_DIRECTORY/lib/google_lib.sh
source $SCRIPT_ROOT_DIRECTORY/lib/alibaba_lib.sh

PRODUCT=$1
CLOUD=$2
REGION=$3
TENANT=$4
MODE=$5

#define specific tenant folder
TENANT_ENV_VARIABLE_SPECIFICATION=config/$1/$2/$3/$4

#each tenant environment desired configuration is stored in config_input_specification.cfg
source $SCRIPT_ROOT_DIRECTORY/$TENANT_ENV_VARIABLE_SPECIFICATION/config_input_specification.cfg

#each tenant environment existing infrastructure setup is stored in config_resulting_state.output
source $SCRIPT_ROOT_DIRECTORY/$TENANT_ENV_VARIABLE_SPECIFICATION/config_resulting_state.output

echo 'deploying additional resources defined in ' $SCRIPT_ROOT_DIRECTORY/$TENANT_ENV_VARIABLE_SPECIFICATION/config_input_specification.cfg

create_vpc
