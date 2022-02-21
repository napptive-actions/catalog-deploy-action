#!/bin/sh

###################################################################
# Command:                                                        #
# run -e PLAYGROUND_PAT=...  "appName" "environment" "configFile" #
###################################################################

# get args
appName=$1
environment=$2
configFile=$3

# add actual dir to the path to allow execute the playground command
export PATH=$PATH:./

## appName cannot be empty
if [[ -z "$appName" ]]; then
    echo "appName can not be empty"
    exit -1
fi

# if there is a configFile...
if [[ -n "$configFile" ]]; then
    mkdir -p ${HOME}/.napptive
    cp ${configFile} ${HOME}/.napptive/.playground.yaml
fi

# Step 1. Login in to the platform
# Login into the platform (with pat flag)
playground login --pat
if [[ $? -ne 0 ]]; then
    exit -1
fi


# if environment!= "" -> use it!
if [[ -n "$environment" ]]; then
    playground env use ${environment}
    if [[ $? -ne 0 ]]; then    
        exit -1
    fi
fi
echo "deploying ${appName}..."
# deploy the app
playground catalog deploy ${appName}
if [[ $? -ne 0 ]]; then    
    exit -1
fi

# Do not wait until the app will be removed -> if this action is required -> add a new playground action


