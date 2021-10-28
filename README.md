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
Our risk assessment was continuously updated, throughout the day the Scrum master would ask if any possible thoughts of risks had occurred whilst working.
If they had, they were added to the risk assessment. For example, later in the project we realised that using Docker swarm with Jenkins could relate in sensitive information being pushed to Github. 
Below, you can see our risk assessment early along in the project. 
However, click [here](https://qalearning-my.sharepoint.com/:x:/g/personal/sstewart_qa_com/EQ4FxXqWGNZClIU_0_Z0280Bp6metj3K_4pN2sDVzWym7Q?e=GgMns5) to see the full risk assessment. 

![image](https://drive.google.com/uc?export=view&id=1OZzRfmJ8Motf4nbfMDfQDNBg7tJnIN8H)

Above: Our risk assessment early on in the process.

<p align="right"><a href="#top">click to go back to  top</a></p>

# Architecture 

As aforementioned, we decided on using the following tools and technologies to complete the deployment. 

* [Terraform](https://www.terraform.io)

Using Infrastucture as Code to provision the resources within AWS to run.

* [Docker](https://www.docker.com)
We used Docker to containerise the applications.

* [Kubernetes](https://kubernetes.io)
Used Kubernetes to deploy containers to clusters

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
To begin with, we need to log in to docker.io as we will be pushing to  the website. To do this we use the command
 * docker login
 * enter in your username and password

To get the app running we first had to containerise it. To containerise the front end a dockerfile was provided which we used. To start with, you had to change directory into the frontend folder:

* cd frontend/

from there we could build the image with the command:

* docker build -t frontend:latest .

Once the image was built we then were able to tag the image and push it up to docker.io using:

* docker tag frontend hdogar96/frontend

* docker push hdogar96/frontend

This then created an image on docker.io for us to then use in our compose yaml file later on. To containerise the backend, an image was already provided that was located at "springcommunity/spring-petclinic-rest" so we did not need to create our own (unless we wanted to use an external database such as an RDS). Finally, we needed to containerise the nginx reverse proxy we were going to use so a simple dockerfile was made to containerise nginx and we also created an nginx.conf file which would configure the nginx image to act as a reverse proxy.


![nginx](https://user-images.githubusercontent.com/43785332/139267953-d0cbc412-91b2-4ba6-becf-a4c69078e62a.PNG)


We then built the image in the same way we did for the frontend:
* docker build -t nginx:latest .
And then pushed it to docker.io:
* docker tag frontend hdogar96/nginx
* docker push hdogar96/nginx
The app was now ready to be deployed, but before we could we needed to make some small changes to the front end's source code. Two files needed to be adjusted to ensure the nginx container functioned as intended. The changes we made were to the environment.ts file and to the environment.prod.ts file. We changed the line:

REST_API_URL: 'http://localhost:9966/petclinic/api/'

to

REST_API_URL: '/petclinic/api/'

as we were not running the application locally.
After this was done the app was almost set up to run. We used docker compose so that we did not have to manually containerise each aspect of the app everytime we wanted to run it. We created a docker-compose.yaml file which would allow us to containerise the app in a single command.

![docker-compose](https://user-images.githubusercontent.com/43785332/139267982-6993752d-87a8-4ad4-b7a9-173fecedbb15.PNG)


Now the application was ready to be deployed and could be done so with a single command:
* docker-compose up -d
To bring the app back, you can run the command:
* docker-compose down
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
    However, because it requires separate installations of various CLI tools and having to have high level all of them, given more time and improved understanding this may have been a better tool to implement.
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
