# GCP-VM-Shutdown-Cloud-Function

In this endeavor, I have successfully orchestrated the deployment of a Google Cloud Function designed to efficiently shut down any active Virtual Machines. This was accomplished utilizing Terraform, demonstrating the benefits of Infrastructure as Code (IaC) management in action.

The deployment process was optimized with the adoption of a Continuous Deployment (CD) strategy. This involved a seamless integration of our GitHub repository with Google Cloud Source Repositories, and the inclusion of Snyk for vigilant vulnerability monitoring.

Powering the deployment workflow is a series of Cloud Build pipelines. These pipelines facilitate the automated deployment of Terraform infrastructure code, leading to the effective set-up of the Cloud Function and the Cloud Scheduler. With this automation in place, the Cloud Function can be reliably triggered on a daily basis, demonstrating the power of automation in cloud infrastructure management


## Architecture Breakdown

The Cloud Function is broken down into the architecture below:

![applications](https://github.com/rjones18/Images/blob/main/Screen%20Shot%202023-05-23%20at%201.11.18%20PM.png)

