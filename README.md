<div id="top"></div>

# PetClinic_Final_Project

# Contents
 
* [Project overview]()
* [Project Tracking]()
* [Risk Assessment]()
* [Setup Guide]()
* [Cost] ()
* [Architecture]()
     * [Databases]()
     * [CI Pipeline]()
* [Deployment]()
* [Testing]()
* [Cost] ()
* [Areas for improvements]()
* [Conclusion]()
* [References]()
* [Acknowledgements]()
* [Licenses]()


# Project Overview
For our project we were given a working CRUD application that had a separate Frontend and backend. 
It is our job to make it have a separate database to essentially transform it into a 3 tiered architecture.

- [ ] Frontend (makes HTTP requests to the backend, that his front end gets its contents.) Angular a Typescript version of flask.
- [ ] Backend (API, just returns information,no HTML attached)  Spring boot, (Java version of flask)
- [ ] Database
- [ ] 
We needed to containerise the frontend and the backend within Docker , successfully allowing the backend to interact with the database.


Taking an application, putting it into a container, and it still work inside the container.


The frontend and backend application are both in languages we are not yet accustomed to. The frontend was an Angular application in typescript and the backend was a spring boot application in Java. We were required to deploy the application or in simpler terms making the application available via the internet. As a group we had to decided which tools would be best suited to our project. We eventually decided on XYZ. The reasoning for these choices is as follows.


Docker swarm


We were expected and required to hold daily stand ups.


<p align="right"><a href="#top">click to go back to  top</a></p>

# Project Tracking

![image](https://drive.google.com/uc?export=view&id=1oeDcklB2ejK4beDp1qBAKwIfnop-vd9k)



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

We decided on using the following tools and technologies to complete the deployment:

* [Terraform](http://terraform.io)
* [Docker](https://www.docker.com)
* [Kubernetes](https://kubernetes.io)
* [AWS](https://aws.amazon.com)

<p align="right"><a href="#top">click to go back to  top</a></p>

## Databases

<p align="right"><a href="#top">click to go back to  top</a></p>


## CI Pipeline
Our CI pipeline 
<p align="right"><a href="#top">click to go back to  top</a></p>

# Setup Guide

<p align="right"><a href="#top">click to go back to  top</a></p>

# Deployment

<p align="right"><a href="#top">click to go back to  top</a></p>

# Testing

<p align="right"><a href="#top">click to go back to  top</a></p>

# Cost

Our cost varied a great deal, this was because we went from using Docker Swarm to using EKS.
Originally we were projected to spend £7.28 a day with full deployment.
However, once we switched to using Kubernetes our projected cost estimates were < ADDHERE > 


<p align="right"><a href="#top">click to go back to  top</a></p>


In terms of cost estimation/projection, we used the AWS calculator and our only expenditures were the 3 medium instances, and RDS and the nat gateway. 
It appears the AWS Calculator does not take free tier accounts into consideration, hence the charge for the RDS  

<p align="right"><a href="#top">click to go back to  top</a></p>

## Areas of improvement

* Using Kubernetes would have allowed for further functionality than Docker Swarm. 
    However, because it requires separate installations of various cli tools and having to have high level all of them, given more time and improved understanding this may have been a better tool to implement.
* Using Jira instead of Trello to better organise tasks and create burndown charts.
* A general better understanding of the tools.

<p align="right"><a href="#top">click to go back to  top</a></p>

## Sprint retrospective
# What went well
 * Organised tasks effectively
 * Good and frequent communication
 * Motivating team which helped all of us keep focused
 * Good pair programming work despite working remotely
 * Good collaboration
 * Bounced back fast from setbacks

# What could be improved:
* Time Management
* Being more meticulous
* Use kubernetes earlier in the deployment - (have better understanding of tools)
* What would we do next time:
* Have more scheduled check in every 2  hours as a group.
* Having better understanding of team members specific strengths and weaknesses


## Conclusion

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
