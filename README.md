<div id="top"></div>

# PetClinic_Final_Project

# Contents
 
* [Project overview](https://github.com/JasonAntonino/PetClinic_Final_Project/tree/dev#petclinic_final_project)
* [Project Tracking](https://github.com/JasonAntonino/PetClinic_Final_Project/tree/dev#project-tracking)
* [Risk Assessment](https://github.com/JasonAntonino/PetClinic_Final_Project/tree/dev#risk-assessment)
* [Setup Guide](https://github.com/JasonAntonino/PetClinic_Final_Project/tree/dev#setup-guide)
* [Architecture](https://github.com/JasonAntonino/PetClinic_Final_Project/tree/dev#architecture)
     * [Databases](https://github.com/JasonAntonino/PetClinic_Final_Project/tree/dev#databases)
     * [CI Pipeline](https://github.com/JasonAntonino/PetClinic_Final_Project/tree/dev#ci-pipeline)
* [Deployment](https://github.com/JasonAntonino/PetClinic_Final_Project/tree/dev#deployment)
* [Testing](https://github.com/JasonAntonino/PetClinic_Final_Project/tree/dev#testing)
* [Cost](https://github.com/JasonAntonino/PetClinic_Final_Project/tree/dev#cost)
* [Areas for improvements](https://github.com/JasonAntonino/PetClinic_Final_Project/tree/dev#areas-of-improvement)
* [Conclusion](https://github.com/JasonAntonino/PetClinic_Final_Project/tree/dev#conclusion)
* [References](https://github.com/JasonAntonino/PetClinic_Final_Project/tree/dev#references)
* [Acknowledgements](https://github.com/JasonAntonino/PetClinic_Final_Project/tree/dev#acknowledgements)
* [Licenses](https://github.com/JasonAntonino/PetClinic_Final_Project/tree/dev#licenses)


# Project Overview 
For our project we were given a working CRUD application that had a separate Frontend and backend. 
It is our job to make it have a separate database to essentially transform it into a 3 tiered architecture.


The frontend and backend application are both in languages we are not yet accustomed to. The frontend was an Angular application in typescript and the backend was a spring boot application in Java. We were required to deploy the application or in simpler terms making the application available via the internet. As a group we had to decided which tools would be best suited to our project. We eventually decided on: 

* [Terraform](http://terraform.io)
* [Docker](https://www.docker.com)
* [Kubernetes](https://kubernetes.io)
* [AWS](https://aws.amazon.com)

The reasoning for these tools can be found in [Architecture](https://github.com/JasonAntonino/PetClinic_Final_Project/tree/dev#architecture)
We were also expected and required to hold daily stand ups with a Scrum master in place and inline with Agile methodologies.


<p align="right"><a href="#top">click to go back to  top</a></p>

# Project Tracking

We kept a log of our tasks and decided to keep it to one sprint implementing MOSCOW methodologies.


![image](https://drive.google.com/uc?export=view&id=1oeDcklB2ejK4beDp1qBAKwIfnop-vd9k)

above: Our inital Trello board. 

Below: Our final trello board.



<p align="right"><a href="#top">click to go back to  top</a></p>

# Risk Assessment

The risk assessment enabled us to foresee and address any problems. 
Our risk assessment was continuosly updated, throughout the day the Scrum master would ask if any possible thoughts of risks had occurred whilst working.
If they had, they were added to the risk assessment. For example, later in the project we realised that using Docker swarm with Jenkins could relate in sensitive information being pushed to Github. 
Below, you can see our risk assessment early along in the project. 
However, click [here](https://qalearning-my.sharepoint.com/:x:/g/personal/sstewart_qa_com/EQ4FxXqWGNZClIU_0_Z0280Bp6metj3K_4pN2sDVzWym7Q?e=GgMns5) to see the full risk assessment. 

![image](https://drive.google.com/uc?export=view&id=1OZzRfmJ8Motf4nbfMDfQDNBg7tJnIN8H)

Above: Our risk assessment early on in the process.

<p align="right"><a href="#top">click to go back to  top</a></p>

# Architecture 

As aformentioned, we decided on using the following tools and technologies to complete the deployment. 

* [Terraform](https://www.terraform.io)

Using Infrastucture as Code to provision the resources within AWS to run.

* [Docker](https://www.docker.com)
We used Docker to containerise the applications.

* [Kubernetes](https://kubernetes.io)


* [AWS](https://aws.amazon.com)

We used AWS for services such as the EKS clusters, EC2's

<p align="right"><a href="#top">click to go back to  top</a></p>

## Databases
We were intending to switch from the inbuilt database to RDS but after having Docker Swarm issues and switching to kubernetes issues time did not permit.
<p align="right"><a href="#top">click to go back to  top</a></p>


## CI Pipeline
Our CI pipeline 

Attached is our CI Pipeline that displays how we intended to implement it all for a successful deployment. 

![image](https://drive.google.com/uc?export=view&id=1jt36BnxQQjvoHgwG6GzuYjUszp1GaQxW)

Above: Our CI pipeline 

<p align="right"><a href="#top">click to go back to  top</a></p>

# Setup Guide

<p align="right"><a href="#top">click to go back to  top</a></p>

# Deployment



<p align="right"><a href="#top">click to go back to  top</a></p>

# Testing

<p align="right"><a href="#top">click to go back to  top</a></p>

# Cost

In terms of cost estimation/projection, we used the AWS calculator and our only expenditures were the 3 medium instances, and RDS and the nat gateway.
It appears the AWS Calculator does not take free tier accounts into consideration, hence the charge for the RDS.  
Our cost varied a great deal, this was because we went from using Docker Swarm to using EKS.
Originally we were projected to spend £7.28 a day with full deployment.
However, once we switched to using Kubernetes (whilst using inbuilt database) our projected daily costs were £6.87, as seen below.

![image](https://drive.google.com/uc?export=view&id=18vVaLfscNoFXuD49GXIWZ2ma8-bne7Og)


However, if we had been able to fully implement our desired vision our costs would have looked closer to £11.57 per day, as seen below.

![image](https://drive.google.com/uc?export=view&id=1b0i9qdCPSuVqpZXFhr6Xfz3kXPG_34L2)

 
<p align="right"><a href="#top">click to go back to  top</a></p>

# Areas of improvement

* Using Kubernetes would have allowed for further functionality than Docker Swarm. 
    However, because it requires separate installations of various cli tools and having to have high level all of them, given more time and improved understanding this may have been a better tool to implement.
* Using Jira instead of Trello to better organise tasks and create burndown charts.
* A general better understanding of the tools.

<p align="right"><a href="#top">click to go back to  top</a></p>


# Conclusion
This project allowed our team to evaluate the pros and the cons of the tools and technologies we had considered, in a very hands on way. 
For instance, we are now very aware of not only the capabilities but limitations and difficulties Docker Swarm can come with. On the otherhand, our understanding and useage of Terraform has grown exponentially. 
As a group we organised tasks effectively with good and frequent motivating communication. 
We utilised pair programming which enabled us to bounce back fast from setbacks.

<p align="right"><a href="#top">click to go back to  top</a></p>

## References

(https://www.ibm.com/cloud/blog/docker-swarm-vs-kubernetes-a-comparison)

<p align="right"><a href="#top">click to go back to  top</a></p>

## Acknowledgements
* We would like to acknowledge our tutors at QA for their teaching of technologies necessary to complete this task. 
* We would also like to thank our team, without our combined cooperation this would not have been possible.

<p align="right"><a href="#top">click to go back to  top</a></p>

# Licenses

GNU GENERAL PUBLIC LICENSE
                       Version 3, 29 June 2007

 Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.

see [LICENSE.txt]() for more information.




<p align="right"><a href="#top">click to go back to  top</a></p>
