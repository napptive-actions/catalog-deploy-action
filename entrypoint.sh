#!/bin/sh

###################################################################
# Command:                                                        #
# run -e PLAYGROUND_PAT=...  "appName" "environment" "configFile" #
###################################################################

# get args
debug=$1
appName=$2
environment=$3
configFile=$4

## appName cannot be empty
if [[ -z "$appName" ]]; then
    echo "appName can not be empty"
    exit 1
fi

# if there is a configFile...
if [[ -n "$configFile" ]]; then
    echo "using custom installation from $configFile "    
    mkdir -p /napptive
    cp ${configFile} /napptive/.playground.yaml
    if [[ $? -ne 0 ]]; then
      exit 1
    fi
    export PLAYGROUND_CONFIG=/napptive/
    echo "PLAYGROUND_CONFIG env added: $PLAYGROUND_CONFIG"    

fi

# add actual dir to the path to allow execute the playground command
export PATH=$PATH:/app/

# Step 1. Login in to the platform
# Login into the platform (with pat flag)
/app/playground login --pat --debug=$debug 
if [[ $? -ne 0 ]]; then
    exit 1
fi


# if environment!= "" -> use it!
if [[ -n "$environment" ]]; then
    /app/playground env use ${environment} --debug=$debug 
    if [[ $? -ne 0 ]]; then    
        exit 1
    fi
fi
echo "deploying ${appName}..."
# deploy the app
/app/playground catalog deploy ${appName} --debug=$debug 
if [[ $? -ne 0 ]]; then    
    exit 1
fi

# Do not wait until the app will be removed -> if this action is required -> add a new playground action


