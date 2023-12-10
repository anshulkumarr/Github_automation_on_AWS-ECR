# mapup_project
This is the assesment project given by MapUp

## GitHub Repository Setup
I have created a simple html file.

Then I added the dockerfile with the base image of nginx:alpine. As it is very light. And to use the nginx:alpine to serve your specific HTML page instead of the default NGINX page,
you have to modify the Dockerfile to replace the default NGINX configuration with your custom configuration


## Docker Image Creation
Now to test and create the image from the Dockerfile.
```
docker build -t hello-world .

```
This will build the docker image with name hello-world. Now to run this.
```
docker run -p 8080:80 hello-world  .

```
-p is to specify the port. 
-p<localhost_port>:<docker_exposed_port> .
As we have exposed port 80 of the docker.

-->

## AWS ECR Setup
Now we will login to our AWS account. And go to ECR by searching in the services section.

Then we will create a new repository.(I have given the name hello-world)

Now to access this we have to create a user. And to create a user we have to go to IAM service.

In the left side of the screen you will find Users section. There create a new user. Give a username and click on the checkbox for aws console-> I want to create an IAM user ->set up password.
If you want to have to give the same permissions now and then, then you can create a group. But for this we will directly give permissions by "Attach policies directly". And then from the below list selecting the 
permissions for ECR. And then create user. 
Now go to user list and click on the user name you just created. Now "create access key". And choose the option suitable for your task. And download the.csv file for future use of access key and secret access key.



## GitHub Actions Workflow

The GitHub Actions workflow automates the process of building and pushing a Docker image to Amazon Elastic Container Registry (ECR) when changes are pushed to or pull requests are made against the main branch. It utilizes Docker Buildx for multi-platform builds and AWS CLI for ECR authentication.
You also have to set the 'aws credentials in your local machine. 
### Workflow Overview

### Trigger

- The workflow is triggered on `push` events to the `main` branch.
- It's also triggered on `pull_request` events targeting the `main` branch.

### Job

- There's a single job named `build-and-push` that runs on the latest version of Ubuntu.

### Steps

1. **Checkout Repository:**
   - Uses the `actions/checkout` action to clone the repository.

2. **Set up Docker:**
   - Uses the `docker/setup-buildx-action` action to set up Docker Buildx.

3. **Install AWS CLI:**
   - Installs the AWS CLI on the runner.

4. **Set AWS Credentials and Region:**
   - Creates AWS credentials and region configuration files using the provided secrets.

5. **Debug AWS CLI Configuration:**
   - Displays the AWS CLI configuration for debugging purposes.

6. **Login to AWS ECR:**
   - Logs in to the AWS ECR using the AWS CLI and Docker login.

7. **Build and push Docker image:**
   - Sets an environment variable `TAG` for the Docker image tag.
   - Creates and uses a Docker Buildx builder.
   - Builds a Docker image with multi-platform support for the `linux/amd64` platform.
   - Tags the image with the specified tag.
   - Pushes the Docker image to the AWS ECR registry.

### Environment Variables

- `AWS_REGION`: AWS region obtained from the `secrets.AWS_REGION` secret.
- `AWS_ECR_REGISTRY_URI`: AWS ECR registry URI obtained from the `secrets.AWS_ECR_REGISTRY_URI` secret.

### Usage

1. Set the required secrets (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_REGION`, and `AWS_ECR_REGISTRY_URI`) in the GitHub repository settings.

2. Customize the `TAG` variable in the workflow based on your versioning strategy.

# Now How to test
Go to CLI of your machine. And run 
```
git clone https://github.com/anshulkumarr/mapup_project.git
```

And now the repository will get copied to your local system. And in the github section you can see that all the task assigned in the workflow are completed.
