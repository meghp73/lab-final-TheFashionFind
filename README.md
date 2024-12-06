# TheFashionFind E-commerce Platform

## Project Overview

TheFashionFind is a comprehensive e-commerce clothing platform deployed entirely on AWS using Terraform for Infrastructure as Code (IaC). The project leverages a modular Terraform approach to create a scalable, resilient, and maintainable cloud infrastructure.

## Primary Functions

1. Product browsing
2. Cart management
3. Order processing
4. Secure payment
5. User account management

## Architecture Overview
### Infrastructure Highlights

* Cloud Platform: Fully deployed on Amazon Web Services (AWS)
* Infrastructure Management: Terraform IaC with modular architecture
* Deployment Strategy: Modularized Terraform modules for each architectural component

    * Enables easy configuration
    * Promotes infrastructure reusability
    * Simplifies management and updates

### Architecture Diagram

![App Screenshot](https://github.com/meghp73/lab-final-TheFashionFind/blob/main/images/Architecture%20Diagram.png)

1. Frontend

    * Web and Mobile Clients
    * Responsive User Interface
    * Amazon CloudFront for static asset delivery


2. Load Balancing & Scaling

    * Elastic Load Balancer (ELB)
    * Auto-Scaling Groups
    * Dynamic instance scaling based on demand


3. Application Layer

    * Serverless Microservices (Amazon ECS/AWS Lambda)
    * Customizable APIs
    * Amazon Cognito for user authentication


4. Database Layer

    * Amazon RDS for transactional data
    * Amazon DynamoDB for non-relational data
    * Read replicas for scalable read operations


5. Storage

    * Amazon S3 for media and log storage
    * High durability and cost-efficiency


6. Event Management

    * Amazon SQS for event queuing
    * Amazon EventBridge for workflow triggers


7. Analytics & Personalization

    * Amazon Kinesis Data Firehose
    * Amazon Personalize for product recommendations


8. Monitoring & Logging

    * Amazon CloudWatch
    * AWS CloudTrail for audit trails


## Performance Requirements
### Network & Bandwidth

* Data Ingress: ~5 GB/day
* Data Egress: ~10 GB/day
* Target Latency: <100 ms for primary operations

### Database Performance

* Transactions Per Second (TPS): 10-15 during peak hours
Read-Write Ratio: 2:1
Daily Operations:

    * ~1000 reads
    * ~500 writes

### Storage

* Initial Storage: 100 GB
* 1-year retention
* 20% monthly storage growth projection

## Resiliency Features

### Elasticity

* Auto-scaling group for dynamic instance management
* Traffic distribution across multiple instances


### High Availability

* Redundant servers across multiple Availability Zones
* Separate data tiers to prevent conflicts
* Multi-node ElastiCache setup


### Automated Recovery

* Amazon CloudWatch monitoring
* Automatic instance recovery
* Critical issue notifications

## Peak Performance Considerations
### Seasonal Variance

Traffic and order volumes may spike 50-100% during:

* Black Friday
* Cyber Monday
* Holiday season sales
* Seasonal clearance events
