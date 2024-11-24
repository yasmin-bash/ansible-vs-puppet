# Ansible vs Puppet: Comparative Study

This repository contains my graduation project, which explores the use of **Ansible** and **Puppet** for automating server deployment and configuration. The project focuses on comparing these two tools in terms of usability, performance, and efficiency in managing infrastructure.

## Project Overview
The goal of this project is to evaluate how **Ansible** and **Puppet** compare when used to automate the deployment of a web server (Nginx) and a database server (MySQL). The project includes:
- **Ansible Playbooks**: YAML-based scripts that define server configurations and application setups.
- **Puppet Manifests**: Configuration files that define the system setup in Puppet’s domain-specific language (DSL).

## Setup Instructions

### Prerequisites
Make sure you have the following installed on your system before proceeding:
- **Docker**: To create isolated environments for testing.
- **Ansible**: To execute automation playbooks.
- **Puppet**: To apply configuration manifests.

### Clone This Repository
Use the following commands to clone and navigate into the repository:

```bash
git clone https://github.com/yasmin-bash/ansible-vs-puppet.git
cd ansible-vs-puppet

1-Ansible Setup:

  1]  Navigate to the ansible/ directory:

cd ansible/

  2]  Edit the inventory file to match your server's details (if applicable).

  3]  Run the playbook (example: for deploying a web server (Nginx)):

    ansible-playbook webserver.yml

2- Puppet Setup:

   1] Navigate to the puppet/ directory:

cd puppet/

   2] Apply the Puppet manifest (example: for deploying Nginx):

puppet apply nginx.pp

Project Structure:

Here's the structure of the project files:
ansible-vs-puppet/
├── ansible/
│   ├── webserver.yml        # Ansible playbook for Nginx deployment
│   ├── database.yml         # Ansible playbook for MySQL setup
├── puppet/
│   ├── nginx.pp             # Puppet manifest for Nginx deployment
│   ├── mysql.pp             # Puppet manifest for MySQL setup
├── docs/
│   ├── performance_metrics.png  # Any graphs or images related to your project
│   └── architecture_diagram.png # Deployment architecture diagram
├── README.md                # Documentation file

Performance Metrics:
Execution Time Comparison:

Task			Ansible (sec)	Puppet (sec)
Web Server Setup	12		18
Database Setup		20		25

Technologies Used:

    Automation Tools: Ansible, Puppet
    Containerization: Docker
    Languages: YAML, Puppet DSL
    Web Server: Nginx
    Database: MySQL

Future Work:

    Enhance the automation process with CI/CD pipelines.
    Test with larger infrastructures to evaluate scalability.
    Optimize performance by analyzing logs and benchmarks.

Author:

Yasmin 
    GitHub: github.com/yasmin-bash
