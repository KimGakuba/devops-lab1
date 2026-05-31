# Lab 1 — Linux & Git Foundations

## What this project does

Automates setup of a fresh Ubuntu server for the university IT club website.

After running the script the server has NGINX, UFW, Git, and Curl installed, with ports 22, 80, and 443 open.

## Files

* provision.sh — installs and configures everything on the server.

## How to run

### Directly on the VM

```bash
chmod +x provision.sh
sudo ./provision.sh
```

## Verify

Open:

```text
http://192.168.1.68
```

You should see the NGINX welcome page.

## Repository

(Add GitLab URL later)

## Screenshots

* screenshots/c1.png — sshd_config settings
* screenshots/c2.png — NGINX welcome page

## Pre-Lab Answers

### Q1. What is the difference between sudo su and su -?

sudo su uses the current user's password and gives root privileges.
su - requires the root user's password and loads the root user's full environment.

### Q2. Why do we use SSH keys instead of passwords for remote login?

SSH keys are much stronger than passwords, harder to guess, and provide more secure authentication.

### Q3. What does chmod 600 ~/.ssh/authorized_keys do, and why does SSH require it?

It allows only the owner to read and write the file. SSH requires strict permissions to prevent unauthorized access to authentication keys.

## Answers

### PQ1

Automatic upgrades can break applications or services unexpectedly. Real organizations test updates in staging environments before deploying them to production.

### PQ2

Without UFW, all services may be exposed to the internet. Leaving port 22 open increases the risk of brute-force attacks. Risks can be reduced by using SSH keys and restricting access to trusted IP addresses.

### PQ3

Version control provides reproducibility, collaboration, change tracking, and auditing. Team members can review changes and recreate infrastructure consistently.
