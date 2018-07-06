# Get Ready for DevOps and Containers

An introduction to the principles of DevOps and containerisation using Visual Studio Team Services (VSTS.

## Overview

This lab outlines the process to compile a containerised web application and deploy it to Azure, using Visual Studio Team Services (VSTS) to create a DevOps continuous build pipeline which will package up your app files and deliver them to Aure. The containerised app will then be run by Kubernetes (using the Azure Kubernetes Service), which will automatically orchestrate the containers your app will be running in to ensure they're highly available and performing well.

Below are the description for the terminolgy used in the lab document to help you get started:

1. **Docker:** Docker is a software technology that provides operating-system-level virtualization to easily deploy applications in a sandbox (called containers).

2. **Images:** An image is a read-only template with the necessary instructions required for the application to run.

3. **Containers:** Provides an isolated environment in which an app along with its environment is run.

4. **Kubernetes:** Kubernetes is an open source orchestrator for managing containerised applications across multiple hosts (physical servers), providing basic mechanisms for deployment, maintenance, and scaling of applications.

5. **Pods:** A Pod is the basic building block of Kubernetes and represents a executable unit of work. A Pod usually contains a single container.

6. **Services:** A service tells other pods about the services your application provides.

7. **Deployments:** A Deployment controller provides declarative updates for Pods

8. **Kubernetes Manifest file:** Kubernetes manifests with deployments, services and pods can be defined in json or yaml. The file extensions .yaml, .yml, and .json can be used.

## What you'll be doing

In this lab, you will:

1. Create an Azure Container Registry (ACR), AKS and Azure SQL server

2. Provision the VSTS Team Project with a .NET Core application using the VSTS Demo Generator tool

3. Configure endpoints (properties) in VSTS to access Azure and AKS

4. Configure application and database deployment using Continuous Deployment (CD) in VSTS

5. Modify database connection string & ACR configuration in the source code
Initiate the build to automatically deploy the application
