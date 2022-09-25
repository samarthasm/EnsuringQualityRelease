# Project: Ensuring Quality Releases 

In this project, we create disposable test environments and run a variety of automated tests with the click of a button. Additionally, we monitor and provide insight into an application's behavior, and determine root causes by querying the application’s custom log files.

For this project, we leverage the following tools:

Azure DevOps: For creating a CI/CD pipeline to run Terraform scripts and execute tests with Selenium, Postman and Jmeter
Terraform: For creating Azure infrastructure as code (IaS)
Postman: For creating a regression test suite and publish the results to Azure Pipelines.
Selenium: For creating a UI test suite for a website.
JMeter: For creating a Stress Test Suite and an Endurance Test Suite.
Azure Monitor: For configuring alerts to trigger given a condition from an App Service.

## Getting Started

Below are the instructions for how to get a copy of the project running on your local machine:

### Dependencies

```
Install Visual Studio Code: https://code.visualstudio.com/
Create an Outlook Account: https://outlook.live.com/
Create a free Azure Account: https://azure.microsoft.com/
Create an Azure Devops account: https://azure.microsoft.com/services/devops/
Install Azure CLI: https://docs.microsoft.com/cli/azure/install-azure-cli?view=azure-cli-latest
Install Terraform: https://learn.hashicorp.com/tutorials/terraform/install-cli#install-terraform
Install the Java Development Kit: https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html
Install JMeter: https://jmeter.apache.org/download_jmeter.cgi
Install Postman: https://www.postman.com/downloads/
Install Python: https://www.python.org/downloads/
Install Selenium for Python: https://pypi.org/project/selenium/
Install Chromedriver: https://sites.google.com/a/chromium.org/chromedriver/downloads
```

### Installation

The steps to begin with are as follows:

1.  Login to the azure portal, connect to the cloud shell terminal.
     Then generate the ssh keys via the following command:
     
     ssh-keygen -t rsa
     
2.  Save the generated SSH key, login to the github account, create a repository and then add the generated SSH key to github account. We then clone the repo using ssh github link in the Cloud Shell and cd into it
    ![image](https://user-images.githubusercontent.com/4275543/190401953-cf404e89-f069-45a6-985a-42a56f56420f.png)

3. Configure storage account and state backend for Terraform. Also, add the Service Principal details for Terraform.

4. Configure a self hosted environment using Azure Pipelines with the help of following steps:
  a. Login to https://dev.azure.com 
  b. Create a new public project
  c. Create a new service connection to Azure Resource Manager, select subscription and the app service
  d. Create a new pipeline linked to your GitHub repo using GiThub YAML File.
<img width="960" alt="terraformApplySuccessSnip" src="https://user-images.githubusercontent.com/4275543/192171504-34969cd7-493c-4461-bbe1-0b386f590d15.PNG">

## Testing

1. Create a selenium test for the deployed web app.
<img width="960" alt="seleniumUItestSuccessSnip1" src="https://user-images.githubusercontent.com/4275543/192171400-663de8ac-aae6-451a-a9a5-97c245cb2b5d.PNG">
<img width="960" alt="seleniumUItestSuccessSnip2" src="https://user-images.githubusercontent.com/4275543/192171406-e4639b3d-9ec9-4395-8493-ff16c8f8af82.PNG">

2. Create postman test suit to test the enpoint and jMeter test suit to test the perfomance of the app.
<img width="410" alt="postmanDataValidationSuccessSnip" src="https://user-images.githubusercontent.com/4275543/192171418-ed1cfcb8-feac-463f-be6f-cacd7ff691fb.png">
<img width="464" alt="postmanRegressionTestSuccessSnip" src="https://user-images.githubusercontent.com/4275543/192171421-0f5f16e9-3237-4e6c-81f3-b259efebe18b.png">
<img width="960" alt="EnduranceTestHTMLReportSnip" src="https://user-images.githubusercontent.com/4275543/192171457-f4f12d59-f85c-4397-8fd7-12a156b04d16.PNG">
<img width="960" alt="StressTestHTMLReportSnip" src="https://user-images.githubusercontent.com/4275543/192171462-dfeb10ee-3a3c-458a-89e0-6d23f0290c5a.PNG">
<img width="960" alt="azureMetricsSnip" src="https://user-images.githubusercontent.com/4275543/192171470-729a43e8-d026-44e4-8f4b-09ee21f21ca4.PNG">

3. Configure Azure alert rule, alert action group, and add a diagnostic setting to utilize the Log Analytics Workspace.
<img width="960" alt="azureAlertRule" src="https://user-images.githubusercontent.com/4275543/192171431-1f650d83-9445-4bd2-8e8a-71f0a356af20.PNG">
<img width="960" alt="azurelogAnalyticsSnip1" src="https://user-images.githubusercontent.com/4275543/192171434-f65c2d84-ef27-4187-9885-a76dc2394b4a.PNG">
<img width="960" alt="azurelogAnalyticsSnip2" src="https://user-images.githubusercontent.com/4275543/192171438-0c13a5a9-f16c-472d-a7e5-73e366fa3e1e.PNG">

## References

•	Udacity Project Starter Files
•	Visual Studio Code
•	Outlook
•	Azure
•	Azure DevOps
•	Azure Command Line Interface
•	Terraform
•	Terraform Azure Documentation
•	Java Development Kit
•	Jmeter
•	Postman
•	Python
•	Selenium for Python
•	Chromedriver
•	Tutorial: Store Terraform state in Azure Storage
•	Get subscription id with Azure CLI
•	Azure Provider: Authenticating using a Service Principal with a Client Secret
•	Terraform - Microsoft DevLabs
•	Install SSH Key Task
•	Azure CLI Authentication does not work when using the Azure CLI task from Azure DevOps
•	Resources in YAML
•	Terraform on Azure Pipelines Best Practices
•	Use secure files
•	Create a Log Analytics workspace with Azure CLI 2.0
•	Install Log Analytics agent on Linux computers
•	Sauce Demo
•	Running collections on the command line with Newman
•	Dummy Rest API Example
•	Collect custom logs with Log Analytics agent in Azure Monitor
