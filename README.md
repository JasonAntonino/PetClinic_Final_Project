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
* [Authors] (https://github.com/JasonAntonino/PetClinic_Final_Project/tree/dev#authors)
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

We kept a log of our tasks within our Trello Kanban style board and decided to keep it to one sprint implementing MOSCOW methodologies.


![image](https://drive.google.com/uc?export=view&id=1oeDcklB2ejK4beDp1qBAKwIfnop-vd9k)

above: Our inital Trello board. 

Below: Our final trello board.
![final_trello](https://user-images.githubusercontent.com/46163696/139329623-a1b39979-b916-4507-bfa4-db2c4574bf44.png)


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

Using Infrastucture as Code to provision the resources within AWS to run easily and allow for the creation of the infrastructure to be automated. Would allow us to create the VPC, subnets, security groups, etc.

* [Docker](https://www.docker.com)

We used Docker to containerise the applications. Allow for the application to be deployed smoothly as the environments that would be created would be consistent. Would be able to containerise all aspects of app (frontend, backend and nginx reverse proxy)

* [Kubernetes](https://kubernetes.io)


Is compatible with the docker images we would create for the application. AWS also provides eks (Elastic Kubernetes Service) so it is a convenient tool.

* [AWS](https://aws.amazon.com)

We used AWS for services such as the EKS clusters, EC2's, VPC and Subnets. AWS provides all the infrastructure needed to deploy the app on.


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

Deployment:

With the app running through docker, we then moved on to setting up the docker swarm. To do this we spun up two medium instances on AWS where one would act as the swarm manager and the other would be a worker. On the manager instance we used the command:

* docker swarm init

as this initialised the swarm and set that instance as the manager. The manager then output a new command that we had to run in the worker so that it knew which instance to join as the worker. The command was in the form of:

* docker swarm join --token [TOKEN] [IP_ADDRESS]:[PORT]

Once this was input into the worker we ready to deploy the stack on the manager thanks to the docker-compose.yaml file we had already created previously. we just needed to use:

* docker stack deploy --compose-file docker-compose.yaml petclinic

This then deployed the stack on the manager and worker. To check that the stack was correctly deployed we listed the services in the terminal and could see that all the services were in fact running. The command to do this was:

* docker service ls

At this point we realised we would face issues when trying to automate this process through jenkins as we would need to get the join token from the manager node and input this into the worker. After a few failed attempts of getting jenkins to do so, we decided to make the change from using docker swarm to using kubernetes instead. We had to make some changes to our terraform so that it would now make use of eks (aws's kubernetes service) and we also had to create ConfigMap manifests for the frontend, backend and nginx.

![frontend-yaml](https://user-images.githubusercontent.com/88770813/139282358-77755053-fc0a-439e-9023-2e8708ceae3a.PNG)

![backend-yaml](https://user-images.githubusercontent.com/88770813/139282442-a7b941d3-44cf-4b9f-b1fb-31c2c0b24a9f.PNG)

![nginx-yaml](https://user-images.githubusercontent.com/88770813/139282486-28053945-c001-4f00-a750-5e4b4c013d97.PNG)

Once these were all created we could then run

* terraform plan
* terraform apply

to create our infrastructure and start our instances. Now we only had to set up jenkins

<p align="right"><a href="#top">click to go back to  top</a></p>

# Testing

An essential part of the CI Pipeline is of course testing to ensure that any changes to the code base are not going to bring down a working version of the app or any of its individual features. Unit tests are an effective way to check new code for any errors and automating this process ensures that no code can slip through untested. Jenkins is a powerful automation server which we implemented to run the unit tests provided to us with the frontend code, with the intention that a successful test would trigger a new build of the Artefacts to be pushed to the DockerHub Registry and then a redeployment of the app would occur, updating the app. Whilst we were able to run the tests succesfully, this resulted in the pipeline hanging as it required some manual input to connect to the karma server and run the debugging. As of yet we have been unable to generate a build of our pipeline where the build does not hang, though we have been able to succesfully automate the deployment of the app.

![testing_2](https://user-images.githubusercontent.com/46163696/139330103-f646e76b-365e-4239-8406-a65ed99e8604.png)


![testing_1](https://user-images.githubusercontent.com/46163696/139330004-b459b51d-0ad7-4aa8-a0c1-ab7f0b98e4ed.png)


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

# Authors
Jason Antonino, Scarlett Stewart, Matthew Logan, Hamza Dogar, Charanjit Pooni 

# Licenses

GNU GENERAL PUBLIC LICENSE
                       Version 3, 29 June 2007

 Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
 Everyone is permitted to copy and distribute verbatim copies
 of this license document, but changing it is not allowed.

see [LICENSE.txt]() for more information.




<p align="right"><a href="#top">click to go back to  top</a></p>
