# 2. Infrastructure

## Proposed Solution
- Single Region Pattern that can withstand application component or site failure.
- Infrastucture will be hosted on Azure Cloud.
- Hub and Spoke network topolgy.
- Azure Component including AKS cluster and Nodes, Azure Firewall and Application Gateway span and distributed across availability zone (AZ) to ensure resilency and availability
- Private Azure Kubernetes Service (AKS) cluster for enhance security, compliance and govenance such as reducing the risk of unauthorized access and attacks from external source. 
- Self hosted Azure DevOps agents
    - Builds and deployments are isolated from the public internet, reducing the risk of data breaches and unauthorized access.
    - Connect to private AKS from DevOps Spoke peered network to automate deployment to AKS cluster.  

## Traffic flow
- 

![](/diagram.jpg)