#!/bin/bash

DURATION=7

if [ "$#" -eq 1 ]; then
  DURATION=$1
fi

sfdx force:org:create -a nto -s -f config/project-scratch-def.json -d $DURATION
sfdx force:source:push
sfdx force:user:permset:assign -n nto
sfdx force:data:tree:import --plan ./data/Merchandise__c-plan.json
sfdx force:data:tree:import --plan ./data/Account-Merchandising_Mix__c-plan.json
sfdx force:org:open -p /lightning/page/home
echo "Org is set up"
