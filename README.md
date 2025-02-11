# Terraform OCI Project - Oracle Cloud File System Provisioning

## Overview
This project demonstrates the provisioning of an Oracle Cloud File System in an Oracle Cloud Infrastructure environment using Terraform. The deployment includes the creation of a Virtual Cloud Network with public subnets, appropriate security lists, a compartment and necessary configurations. 

The main objective is to showcase the provisioning of an Oracle Cloud File System within the subnets and availability domains. Additionally, the project involves the deployment of two OCI instances. One instance is configured with administrative access to the filesystem, while the other instance is restricted from accessing it. The demonstration includes the creation of files in the mounted filesystem to illustrate its functionality.

## Architecture
The architecture consists of a Virtual Cloud Network with subnets where the Oracle Cloud File System is provisioned. Two OCI instances are deployed in the same network. One of these instances has full administrative access to the filesystem, while the second instance is configured to lack access. The filesystem is mounted on the permitted instance, and test files are created to demonstrate the functionality. This setup is useful in scenarios where controlled access to shared storage is required, ensuring that only designated users or instances can modify or interact with stored data.

![image](https://github.com/user-attachments/assets/87a4e9ec-36b4-476c-b9fe-0b7c17513b53)


## Prerequisites
To deploy this project, an OCI account with the necessary permissions is required. Additionally, Terraform must be installed and properly configured, and the OCI CLI should be set up for authentication. SSH keys are necessary to access the OCI instances once they are provisioned. The project also assumes familiarity with Oracle Cloud networking and security principles to configure the necessary policies correctly.

## Project Structure
The project is structured into different Terraform configuration files that define various components such as networking, compute instances, security policies, and the Oracle Cloud File System. These configuration files collectively enable the deployment of the infrastructure in a modular and organized manner. The structure ensures maintainability and scalability, allowing easy modifications and enhancements in future implementations.

## Deployment Steps
The deployment process involves multiple stages to ensure successful implementation:
1. Initializing Terraform to download the required providers and dependencies.
2. Planning the infrastructure to review the resources that will be created.
3. Applying the configurations to provision the infrastructure.
4. Verifying the successful deployment of resources, including checking network connectivity and ensuring the correct security policies are in place.
5. Mounting the Oracle Cloud File System on the designated instance and performing validation tests such as creating and modifying files.
6. Attempting access from the restricted instance to confirm that security measures are functioning as expected.

These steps help in validating that the infrastructure is correctly set up and meets the intended security and functionality requirements.

## Security Considerations
The security lists are configured to allow only the necessary traffic for the instances and the Oracle Cloud File System. The restricted instance is deliberately prevented from accessing the filesystem to illustrate security controls. These configurations ensure that access to the filesystem is properly managed and protected. Additional security enhancements can include using OCI Identity and Access Management (IAM) policies to define granular access rules for the filesystem and instances.

## Future Improvements
Potential improvements to the project include implementing IAM policies for enhanced access control, automating the instance mounting process, and refining security rules to align with best practices. Additional features such as automated backups, logging, and monitoring can be integrated to enhance the reliability and security of the deployment. Future iterations can also explore auto-scaling mechanisms to dynamically adjust resources based on workload demands, ensuring cost optimization and efficiency.

## Use Cases
This project can be useful in various real-world scenarios, including:
- **Enterprise Storage Solutions**: Providing a shared filesystem for multiple compute instances within an organization.
- **High Availability Applications**: Ensuring that critical applications can access shared data while enforcing controlled access.
- **Data Science and Analytics**: Storing and sharing large datasets between compute nodes for processing and analysis.
- **Web Hosting and Content Management**: Allowing distributed web servers to access a common storage repository for serving content efficiently.

## Test infrastructure
- **After Applying this is the terraform state list**:
  ![image](https://github.com/user-attachments/assets/c1ef187a-0c43-4b33-b0a9-7615b78f14ae)
- **Testing Allowed instance**:
  ![image](https://github.com/user-attachments/assets/058e29aa-5235-4b09-94e0-4769d482a5a3)
- **Testing Not Allowed instance**:
  ![image](https://github.com/user-attachments/assets/492b2280-222e-4887-81e5-156829e9d6ee)





