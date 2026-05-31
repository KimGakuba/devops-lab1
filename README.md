# Lab 1 — Linux & Git Foundations

## What this project does

This project automates the setup of a fresh Ubuntu Linux server for the University IT Club website.

After running the provisioning script, the server is configured with:

* NGINX web server
* UFW firewall
* Git version control
* Curl utility

The firewall is configured to allow:

* Port 22 (SSH)
* Port 80 (HTTP)
* Port 443 (HTTPS)

SSH access is hardened by disabling password authentication and root login.

---

## Files

* `provision.sh` — Installs and configures NGINX, UFW, Git, and Curl.
* `README.md` — Project documentation, answers, and instructions.
* `screenshots/checkpoint1.png` — SSH hardening verification screenshot.
* `screenshots/checkpoint2.png` — NGINX welcome page screenshot.

---

## How to Run

### Directly on the VM

```bash
chmod +x provision.sh
sudo ./provision.sh
```

---

## Verify

Open:

```text
http://<VM_IP>
```

Example:

```text
http://192.168.1.68
```

You should see the NGINX welcome page.

---

## Repository

https://github.com/KimGakuba/NGABONZIZA_Kim_Gakuba_27670_GRP_A

---

## Screenshots

* `screenshots/checkpoint1.png` — SSH configuration showing:

  * PasswordAuthentication no
  * PermitRootLogin no

* `screenshots/checkpoint2.png` — NGINX Welcome Page displayed in a web browser.

---

## Pre-Lab Answers

### Q1. What is the difference between sudo su and su -?

`sudo su` uses the current user's password and grants root privileges while keeping parts of the current user's environment.

`su -` requires the root user's password and loads the full root user environment, including root's home directory and environment variables.

---

### Q2. Why do we use SSH keys instead of passwords for remote login?

SSH keys provide stronger authentication than passwords because they are much longer and harder to guess or brute-force. They also reduce the risk of password theft and improve server security.

---

### Q3. What does chmod 600 ~/.ssh/authorized_keys do, and why does SSH require it?

The command:

```bash
chmod 600 ~/.ssh/authorized_keys
```

allows only the file owner to read and write the file.

SSH requires strict permissions on authentication files to prevent unauthorized users from modifying or viewing authorized keys.

---

## Answers

### PQ1. Your script ran apt upgrade -y automatically. On a live production server, why could an unattended upgrade be risky? What could go wrong? How do real organisations handle upgrades more safely?

Automatic upgrades can introduce software incompatibilities, service failures, or unexpected configuration changes that may disrupt production systems.

Real organizations typically test updates in development or staging environments before deploying them to production. They also schedule maintenance windows and maintain backups to reduce risk.

---

### PQ2. What happens if you skip the UFW firewall step? Why is it dangerous to leave port 22 open to the entire internet? Name at least two ways to reduce that risk.

Without UFW, services may be exposed to unauthorized access from the internet.

Leaving port 22 open increases the risk of:

* Brute-force login attempts
* Automated attacks and scanning

Risk can be reduced by:

1. Using SSH key authentication instead of passwords.
2. Restricting SSH access to trusted IP addresses.
3. Disabling root login.
4. Using tools such as Fail2Ban.

---

### PQ3. You committed provision.sh to Git instead of running commands manually. Why is storing infrastructure setup in version control better than typing commands by hand each time?

Version control improves:

* Reproducibility — the same setup can be repeated consistently.
* Collaboration — team members can review and improve scripts.
* Auditing — every change is recorded with a timestamp and author.
* Recovery — previous versions can be restored if mistakes occur.

Infrastructure as code reduces human error and makes server management more reliable.
