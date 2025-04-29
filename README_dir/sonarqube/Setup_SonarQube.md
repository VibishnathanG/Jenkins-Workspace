# Sonarqube Setup

SonarQube is an open-source static testing analysis software, it is used by developers to manage source code quality and consistency.
## 🧰 Prerequisites

Source: https://docs.sonarqube.org/latest/requirements/requirements/
1. An EC2 instance with a minimum of 2 GB RAM (t2.small)  
1. Java 11 installation   
   ```sh 
   amazon-linux-extras list
   amazon-linux-extras install java-openjdk11
   ```
1. SonarQube cannot be run as root on Unix-based systems, so create a dedicated user account for SonarQube if necessary.

## Installation steps

1. Download SonarQube [latest verions](https://www.sonarqube.org/downloads/) on to EC2 instace 
   ```sh 
   cd /opt  
   wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-x.x.zip  
   ```
1. extract packages
   ```sh 
   unzip /opt/sonarqube-x.x.zip
   ```

2. Change ownershipt to the user and Switch to Linux binaries directory to start service
   ```bash
   chown -R <sonar_user>:<sonar_user_group> /opt/sonarqube-x.x  
   cd /opt/sonarqube-x.x/bin/linux-x86-64   
   ./sonar.sh start
   ```
3. Connect to the SonarQube server through the browser. It uses port 9000.   
   `Note`: Port should be opened in the Security group 
   ```bash
   http://<Public-IP>:9000
   ```

   ## 🧹 CleanUp  
   1. Stop SonarQube server
   ```sh 
   cd /opt/sonarqube-x.x/bin/linux-x86-64 
   ./sonar.sh stop
   ```
   1. Terminate EC2 instance incase if you setup only for this lab. 

# README: Creating a systemd Unit File for Linux Services

## Purpose
This document explains how to create and configure a systemd unit file to manage a custom service on a Linux system.

## Steps to Create and Configure
1. **Navigate to the Systemd Directory**:
   Use the following command to navigate to the directory where systemd unit files are stored:
   ```bash
   sudo nano /etc/systemd/system/example.service

# README: Example Systemd Unit File

## Unit Section
- `Description=Example Service`  
  A brief description of the service.
- `After=network.target`  
  Specifies that this service should start after the network is available.

## Service Section
- `ExecStart=/usr/bin/example-command`  
  The command that is executed to start the service.
- `Restart=always`  
  Configures the service to always restart if it stops.
- `User=exampleuser`  
  Runs the service as the specified user (`exampleuser`).
- `WorkingDirectory=/path/to/working/directory`  
  Sets the working directory for the service.

## Install Section
- `WantedBy=multi-user.target`  
  Ensures the service is started in the multi-user runlevel.

## Notes
- Replace `example-command`, `exampleuser`, and `/path/to/working/directory` with your actual values.
- Save this file as `/etc/systemd/system/example.service`.
- Reload systemd after editing the file:
  ```bash
  sudo systemctl daemon-reload


[Unit]
Description=SonarQube service
After=syslog.target network.target
[Service]
Type=forking
ExecStart=/opt/sonarqube-7.6/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube-7.6/bin/linux-x86-64/sonar.sh stop
User=sonar
Group=sonar
Restart=always
[Install]
WantedBy=multi-user.target
