# Get Ready for DevOps and Containers

An introduction to the principles of DevOps and containerisation using Visual Studio Team Services (VSTS) and Azure Container Service (AKS).

## What is Kubernetes?

## What is VSTS?

## In this lab, you will:

1. 
2.
3.

## Prerequisites

* An Azure subscription. You can get one free through [Visual Studio Dev Essentials](https://visualstudio.microsoft.com/dev-essentials/).

## Start your lab environment

Navigate to the link provided to you and click 'provision lab'

## Log into the Azure Portal and connect to your lab workstation


1. Sign into the [Microsoft Azure portal](https://portal.azure.com).  Use the details provided to you when you provisioned your lab in the first step.

1. Locate your workstation - you should see it listed as in the screenshot below.  Click it and you should be taken to the overview page for the virtual machine.

1. Click Connect.  To the right, you should be prompted to download an RDP file.  Go ahead and download this, and double click it once it downloads.

1. Connect to the virtual machine using the username and password provided to you when you provisioned the lab.

1. You should now be able to access your virtual machine!  Next, we will deploy some Azure resources.

## Create a Service Principal and a pair of SSH RSA keys

<Description of a SP, why we need it>

1. Navigate to the Azure Portal you just logged into.
1. Click on the 'Cloud Shell' icon < screenshot> 
1. If prompted to create a storage account, click yes.
1. Once your Bash shell has loaded, type the following:

``` bash
	az ad sp create-for-rbac --name acr-service-principal --role contributor --query password --output tsv
```
1. Make a note of the password, you will need it in the next step.
1. Next, type the following into the same Bash shell:
``` bash
	az ad sp show --id http://acr-service-principal --query appId --output tsv
```
1. Make a note of the appID, you will need it in the next step and later on in the lab.



## Deploy Kubernetes Service and supporting services

1. On your virtual machine, log into the [Microsoft Azure portal](https://portal.azure.com) again using the step above.
1. Click the 'Deploy to Azure' button below to deploy the necessary resources into your Azure subscription. #add button and ARM template to repo!

[![Deploy to Azure](https://azuredeploy.net/deploybutton.svg)](https://azuredeploy.net/)

## Create a VSTS account and generate a demo project

## dd

## dd

## dd


