# What is My IP
  
This repository contains a simple Go application designed to run on Azure Container Apps. The application returns the client's IP address.  
  
## Prerequisites  
  
1. Go 1.20 or later  
2. Azure CLI or Azure Portal access  
  
## Application Structure  
  
- `main.go`: This is the main Go file that runs the HTTP server and defines the endpoint that returns the client's IP address.  
  
## Running the Application Locally  
  
Before deploying the application to Azure Container Apps, you can try it locally using the following steps:  
  
1. Clone this repository.  
2. Navigate to the project directory in your terminal.  
3. Run the application using the command `go run main.go`.  
4. Access the application at `http://localhost:8080`.  
  
## Deploying to Azure Container Apps  
  
After you have verified the application runs as expected locally, you can deploy it to Azure Container Apps. Refer to the [following document](https://github.com/groovy-sky/azure/tree/master/container-app-00#introduction) for the deployment process.  
  
