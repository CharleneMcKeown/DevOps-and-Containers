# Get Ready for DevOps and Containers

An introduction to the principles of DevOps and containerisation using Visual Studio Team Services (VSTS) and Azure Container Service (AKS).

## What is Kubernetes?

## What is VSTS?

## In this lab, you will:

1. Create a Kubernetes cluster in Azure
2. Create a project in VSTS
3. Set up a CI/CD pipeline to deploy a demo website to Kubernetes Service

## Prerequisites

* An Azure subscription. You can get one free through [Visual Studio Dev Essentials](https://visualstudio.microsoft.com/dev-essentials/).

## Start your lab environment

Navigate to the link provided to you and click 'provision lab'

## Log into the Azure Portal and connect to your lab workstation


1. Sign into the [Microsoft Azure portal](https://portal.azure.com).  Use the details provided to you when you provisioned your lab in the first step.

1. Locate your workstation - you should see it listed as in the screenshot below.  Click it and you should be taken to the overview page for the virtual machine.

<img src="screenshots\select_workstation.PNG" alt="Select Workstation" width=600px />

1. Click Connect.  To the right, you should be prompted to download an RDP file.  Go ahead and download this, and double click it once it downloads.

<img src="screenshots\connect_workstation.PNG" alt="Connect" width=600px />

<img src="screenshots\download_RDP.PNG" alt="Download RDP" width=400px />

1. Connect to the virtual machine using the username and password provided to you when you provisioned the lab.


<img src="screenshots\doubleclick_RDP_Connect.PNG" alt="Enter credentials" width=400px />


1. You should now be able to access your virtual machine!  Next, we will deploy some Azure resources.

## Create a Service Principal and a pair of SSH RSA keys

<Description of a SP, why we need it>

1. Navigate to the Azure Portal you just logged into.
1. Click on the 'Cloud Shell' icon and select 'Bash (Linux)'

<img src="screenshots/cloudshell.PNG" alt="Cloud Shell" width="600px"/>

1. If prompted to create a storage account, click yes.
1. Once your Bash shell has loaded, type the following, replacing surname with your own.  Service Principals must have unique names.

``` bash
	az ad sp create-for-rbac --name acr-service-principal-surname --role contributor --query password --output tsv
```
1. Make a note of the password, you will need it in the next shortly.
1. Next, type the following into the same Bash shell, again replacing surname with your own:
``` bash
	az ad sp show --id http://acr-service-principal-surname --query appId --output tsv
```
1. Make a note of the appID, you will need it shortly and later on in the lab.

Next, we'll generate our ssh keys. Open Git-Bash and type the following:

``` bash
	ssh-keygen -t rsa
```

You will be prompted for a file path and a password.  Simply press enter three times to leave both values blank.  

<img src="screenshots/SSH.PNG" alt="SSH" width="400px"/>

The default filepath should be:

``` bash
/home/odl_user/.ssh/id_rsa
```

We need to output the contents of our public key, contained in id_rsa.pub.  To do this, type:

``` bash
	cat .ssh/id_rsa.pub
```

Copy everything to a notebad (it starts with ssh-rsa followed by a long string of characters) - you will need this in the next step.

<img src="screenshots/publickey.PNG" alt="Public Key" width="600px"/>


## Deploy Kubernetes Service and supporting services

1. On your virtual machine, log into the [Microsoft Azure portal](https://portal.azure.com) again using the step above.
1. Click the 'Deploy to Azure' button below to deploy the necessary resources into your Azure subscription.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2FCharleneMcKeown%2FDevOps-and-Containers%2Fmaster%2Fazuredeploy.json"> <img src="screenshots/deploy.PNG" width="200px"> </a>


Subscription: Leave as default (it should auto populate with your lab subscription)
Resource Group: Create a new resource group and give it a name
Location: East US
Acr Name: Choose a unique, lowercase name
DB Server Name: Choose a unique, lowercase name
AKS Name: AKS
DNS Prefix: demoaks
SSH RSA Public Key - Enter the public key you just saved to your notepad
Service Principal Client - Enter the appId generated earlier
Service Principal Client Secret - Enter the password generated earlier

<img src="screenshots/ARM.PNG" alt="Deploy Template" width="600px"/>

## Create a VSTS account and generate a demo project

Now we will generate our demo project, using [VSTS Generator!](https://vstsdemogenerator.azurewebsites.net) If you already have a VSTS account, you can sign into the demo generator and create the project in your account.  If you need a VSTS account, the demo generator will prompt you to sign up.

> [!NOTE]
> Please use Chrome when accessing the demo generator.

<img src="screenshots/demo-generator.PNG" alt="demo-generator" width="600px"/>

## dd

## dd

## dd


