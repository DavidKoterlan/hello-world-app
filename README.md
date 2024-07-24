# Hello World Application

## Table of Contents
1. [Prerequisites](#prerequisites)
2. [Application Components](#application-components)
3. [Setting up the Application](#setting-up-the-application)
4. [Using the Application](#using-the-application)
5. [Cleaning up Resources](#cleaning-up-resources)

## Prerequisites
Before you start, ensure you have the following installed on your local machine:

1. **Docker**: [Install Docker](https://docs.docker.com/get-docker/)
2. **Minikube**: [Install Minikube](https://minikube.sigs.k8s.io/docs/start/)
3. **Kubectl**: [Install Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
4. **Terraform**: [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

## Application Components

### 1. **Application Files**
Located inside the `app` folder:
- **app.js**: A simple Express Node.js application with a single endpoint that returns "Hello World!"
- **Dockerfile**: Used to build the Docker image for the application, which is utilized by the CI pipeline.

### 2. **Kubernetes Manifest Files**
Located inside the `kubernetes` folder:
- **Namespace**, **Deployment**, and **Load Balancer** service definition files.

### 3. **Terraform Files**
Located inside the `terraform` folder:
- **kubernetes-objects.tf**: Defines the Kubernetes objects as Terraform resources.
- **terraform.tfvars.example**: Template for the `terraform.tfvars` file.
- **terraform.lock.hcl**: Locks the providers to ensure deterministic execution of the Terraform commands.

### 4. **CI Pipeline with GitHub Actions**
Located inside the `.github/workflows` folder:
- **build-and-push-image.yml**: A GitHub Actions workflow for building and pushing the Docker image to Docker Hub on every pull request and push.

## Setting up the Application

### Setting up Minikube Cluster
The application is designed to run on a local Minikube cluster. Run the following command to set up the Minikube cluster:

```sh
minikube start
```

### Creating Kubernetes Objects with Terraform
The Kubernetes objects are deployed using a Terraform configuration file named `kubernetes-objects.tf`.

The configuration file uses variables, so you need to create a `terraform.tfvars` file and define the desired variable values. Use the `terraform.tfvars.example` as a template. If using Minikube you should set the `config_context` variable to "minikube". You should also set the path of the **kube config** file in the `config_path` variable.

Use the following commands from the `terraform` folder to deploy the application with Terraform:

```sh
terraform init
terraform apply
```

### Creating Minikube Tunnel
To enable connecting to the Load Balancer service, you need to create a Minikube tunnel with the following command:

```sh
minikube tunnel
```
minikube tunnel runs as a process, creating a network route on the host to the service CIDR of the cluster using the cluster’s IP address as a gateway.

Note: This command needs to run in a separate terminal window or as a background process.

## Using the Application
After setting up the application, your Minikube cluster should expose the Hello World Application via a Load Balancer with the help of the Minikube tunnel. It should map the service's port 8080 to `localhost:8080`.

Visit [http://localhost:8080](http://localhost:8080) or use `curl http://localhost:8080` to see the famous "Hello World!" message.

## Cleaning up Resources
To clean up the resources (delete the Minikube cluster and all the Kubernetes objects), use the following command:

```sh
minikube delete
```