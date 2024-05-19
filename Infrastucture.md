# 2. Infrastructure

## Proposed Solution on Azure Cloud
- Single Region Pattern that can withstand application component or site failure:
    -  Azure Components including AKS cluster and Nodes, Azure Firewall and Application Gateway span and distributed across availability zone (AZ) to ensure resilency and availability
- Hub and Spoke network topolgy: 
    - It makes the architecture extensible. To accommodate new features or workloads, new spokes can be added instead of redesigning the network topology.
    - All traffic between the spokes and to/from passes through the centralized firewall in the hub, allowing for comprehensive inspection, monitoring, and filtering.
    - Azure Firewall, for example, offers advanced threat protection capabilities such as intrusion detection/prevention systems (IDS/IPS), web filtering, and malware protection.
- Private Azure Kubernetes Service (AKS) cluster for enhance security, compliance and govenance such as reducing the risk of unauthorized access and attacks from external source. 
- Self hosted Azure DevOps agents:
    - Builds and deployments are isolated from the public internet, reducing the risk of data breaches and unauthorized access.
    - Connect to private AKS from DevOps Spoke peered network to automate deployment to the WebAPI AKS cluster.  
- Azure Application Gateway:
    - Web traffic load balancer operating at Layer 7.
    - WAF secures incoming traffic from common web traffic attacks, including bots and OWASP Top 10 risk.

### Incoming traffic to Web Service

Application Gateway acts as the entry point for incoming traffic, traffic inspect by WAF and SSL termninate here. If the request is valid and not blocked by WAF, it's forwarded to an ingress controller in AKS and route to Web Service pods.

### Web Service to Internal-Assert Virtual Network

Traffic forced tunnel through the hub Firewall for traffic inspection and filtering before traverse to the internal system hosted in internal-assest virtual network. 

## Architecture Diagram

![](/diagram.jpg)