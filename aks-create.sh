#!/bin/bash

echo Hello, and welcome to the Tech Huddle DevOps ans Containers Lab. Please enter a unique name for the deployment e.g. your name or Microsoft alias:

read uniqueName

#Remove spaces from name to avoid deployment errors

uniqueName="$uniqueName$(( $( od -An -N2 -i /dev/urandom ) ))"

echo $uniqueName

SPKEY="$(az ad sp create-for-rbac --name acr-service-principal-$uniqueName --role contributor --query password --output tsv)"
SPAPPID="$(az ad sp show --id http://acr-service-principal-$uniqueName --query appId --output tsv)"

echo Please hold whilst I provision an AKS cluster for you ready for the day.

echo Provising SSH Keys for AKS.

ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa

#Begin deployment
echo Creating resource group called TechHuddleDevOps$uniqueName...
az group create --name TechHuddleDevOps$uniqueName --location eastus

echo Creating AKS cluster takes a while...
az aks create --resource-group TechHuddleDevOps$uniqueName --name AKSCluster-TechHuddleDevOps$uniqueName -s Standard_B2s --node-count 2 --ssh-key-value ~/.ssh/id_rsa.pub --service-principal $SPAPPID --client-secret $SPKEY

echo Getting credentials...
az aks get-credentials --resource-group TechHuddleDevOps$uniqueName --name AKSCluster-TechHuddleDevOps$uniqueName

echo Storing credentials for AAD App ID / Secret and SSH keys in home directory $HOME/credentials.txt

echo "AAD App ID: $SPAPPID" > $HOME/credentials.txt
echo "AAD Client Secret: $SPKEY" >> $HOME/credentials.txt
echo "SSH KEY: $(cat ~/.ssh/id_rsa.pub)" >> $HOME/credentials.txt

echo All done and good to go. Thank you!
kubectl get nodes