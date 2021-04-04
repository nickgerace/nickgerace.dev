---
layout: post
title: Linux Development Setup Guide
minutes: 8
---

I've spoken to several undergraduate students about having a Linux VM as their development environment.
However... I have not ever detailed what that would look like on either macOS, or Windows.

Today, I want to go through, step-by-step, how to get a working development environment on macOS and Windows as *fast* and *simple* as possible.

## Simplicity Rules

There are many different variations and options to each step of this guide.
However, (maybe this is [Go's](https://golang.org/doc/) design principles wearing off on me) this guide will cover one specific setup process.
There are many Linux distributions and virtualization platforms that may work better for you, but this guide's platforms of choice should will work well for beginners and advanced users alike.

Two quick disclaimers:
- I'll be writing this guide from the perspective of a macOS user. None of the steps should be substantially different for Windows, but you may notice some differences during the VirtualBox section.
- I will not be covering native Linux (or GNU+Linux, if that's what your prefer) desktops because those users are not the target audience for this guide.

## Checklist

On both macOS and Windows, we'll download the following software...

- Ubuntu Server ISO file
- VirtualBox

Essentially, this setup isolates the development environment from the host operating system while avoiding substantial bloat.
Maybe it's the engineering purist in me (*co-workers audibly groan*), but having your playground sandboxed from your daily-driver OS is a great way to learn and work.
In addition, you do not have to worry about clipboard support or weird I/O performance with keyboard and mouse since this setup utilizes a locally-installed terminal.

Some engineers opt for a personal development server, cloud VM instance, a different machine altogether, their native OS, or some other platform.
What's great about using a "headless" (no GUI), virtual machine is that it's both free and not resource intensive.

## Step 1: Download the Ubuntu Server ISO File

*Note: you can perform this step and the following step in parallel.*

Open your preferred web browser and navigate to the [Ubuntu](https://ubuntu.com/) website.
From here, find "Download" and select "Ubuntu Server".

There should be two download options here, an LTS version and a non-LTS version of the Linux distro.
For beginners, I recommend grabbing the LTS version.
For advanced users, I recommend grabbing the non-LTS version.

> *What is the difference in versions?*
> 
> Canonical, the company behind Ubuntu, releases LTS versions on a two-year cadence, with the purpose of creating an exceptionally stable system with long term security updates.
> Non-LTS releases benefit from a six-month cadence, which allows for greater access to new software at a negligible stability cost (at least for most development environments).

Ultimately, the non-LTS version is usually the better option in this context because our developer environment is not serving enterprise applications around the clock.
However, the LTS version should provide guaranteed stability for beginner, and even advanced, users.

After the download finishes, you'll get an ISO file for Ubuntu Server.

> *What is an ISO file?*
>
> [ISO files](https://en.wikipedia.org/wiki/Optical_disc_image) are disk images that can be written to optical disks.
> Today, they are still used for that, but are also the preferred way to package Linux distributions and most OSes, for all kinds of installations (cloud, VMs, USB, etc.).

## Step 2: Download and Install VirtualBox

Open your preferred web browser and navigate to the [VirtualBox](https://www.virtualbox.org) website.
From here, find "Downloads" and select either the "Windows" or "macOS" (also known as OS X) option.

The installer should download automatically.
Once it's finished downloading, follow the on-screen prompts to install VirtualBox.

If any options appear during installation, you can safely choose most defaults.
The only thing to look out for is any additional software offered by the installer.
If additional software offerings appear, you can safetly ignore them as we only need VirtualBox.

## Step 3: Create the Virtual Machine

Open up the VirtualBox app and click on "New".
This will begin the process to create our virtual machine.
You can give the machine a name, choose its machine folder, and determine its type.
Typically, I recommend only using alphanumeric characters when naming your VM.

This section includes what I consider to be sensible defaults, but your mileage and use case may vary.
Nothing here is a "requirement" for configuring your virtual machine.

### Machine Folder

The machine folder is entirely up to you as this is merely where the VM will be stored.
It might seem intuitive to change this setting to the folder of a backup service, such as Google Drive or Dropbox.
However, all the constant writes to the machine will be backed up, so I do not recommend backing up the VM while it is in use.

### Type

For the type, we want to select "Linux" then "Ubuntu 64-bit".

### RAM Size

Now, we select our RAM size.
For developer-focused desktops/laptops, you can set this equal to half of your total RAM.
For most other setups, you should set this to one quarter of your total RAM.
Remember to calculate MB as a power of 2 (i.e. 8 GB of RAM would equate to 8192 MB, not 8000 MB).

*Side note: this is a good time to mention that another benefit of using VMs is that you can change almost all of these options later!*

### Hard Drive

Follow the default options for creating a hard drive, but make sure that the minimum hard drive size is 20 GB.
This might be the most controversial part of this guide as 20 GB is a lot for some users to give up.
However, I have seen some installations perform sub optimally and encounter strange errors in the sub 10 GB territory, so I stick to 20 GB just to be safe.
If you need the space and want to avoid my superstitions, you should be fine with at least 10 GB of hard drive space.

Now, the virtual machine should be finished with initial setup, but we have a few more things to do.

## Step 4: Setup the Virtual Machine

Click on the virtual machine, then select "Settings".
Navigate to the "Network" tab and make sure that the network adapter is set to "NAT".

This should have a dropdown that says, "Attached to: NAT".
We want this option because we want to isolate our network as much as possible when using our VIM.
That might seem like an weak reason, but you can [read more](https://www.virtualbox.org/manual/ch06.html) about virtual networking and what works for you.

Under this same tab, open the "Advanced" menu and click on "Port Forwarding".
Here, we want to add a row to port forwarding table that sets the following...

- (optional) Name: SSH
- Protocol: TCP
- Host IP: 127.0.0.1
- (you choose) Host Port: 2222
- Guest IP: (leave blank)
- Guest Port: 22

For the host port, you can choose any unreserved TCP port number.
You can use the standard port 22, but port 2222 is available and easy to remember as well.
Either will work just fine!
A lot of the magic that this setup provides can be leveraged via the port forwarding tab.

- For example, when testing Flask applications, you can bridge port 5000 and open the app on our host OS's web browsers.
- These options can also lends themselves to better security patterns, but be careful not to abuse port forwarding.
- While we won't cover those examples in this guide, this is where you want to leverage your virtual machine's networking options.

Finally, click on the "Storage" tab and look for the "IDE" controller.
This is your virtual CD-ROM/DVD tray.

Click on the "Empty" disc tray, and you'll see an "Attributes" menu.
From here, change the "Optical Drive" to your downloaded ISO file.
This is how we will install the operating system onto your VM.

Under the same tab, click on "Live CD/DVD", and then exit the settings menu to finish setup.

## Step 5: Install the Operating System

You can think of what we've done so far as building a computer and then loading the Ubuntu Server installation CD into the disc tray.
This is all virtual, but it's simply a mirror of the physical process, at least at a high level.

Now, you want to hit "Start" and you'll get dropped into the Ubuntu Server installer.
I'm going to be a little less detailed in this step, so if you'd like very specific instructions, you can look at the [community installation guide](https://help.ubuntu.com/lts/serverguide/installing-live-server.html).

A big window will appear for the first, and last, time of using the virtual machine.
Since we want to use SSH from our local terminal, we want to install the OS as fast as possible.

Keep in mind, your mouse will not work throughout this step of the process.
Your arrow keys and enter/return button will be more than enough!

Essentially, we are installing a "virtual server" on your host OS, so there is no GUI.
Fortunately, Ubuntu Server has one of the more user-friendly installers and there is a ton of documentation to help you out.

### Navigating the Installer

Choose almost every single default option, barring things like language and keyboard layout.
The installer will use your entire virtual hard drive by default, which is exactly what we want.

The only option you might want to change is to **NOT** install the OpenSSH server.
In practice, this should not really make a difference, but I like to take one thing at a time and do not want to risk any hidden installation options.
I install OpenSSH, and all other additional packages, *after* installation is complete.

After we tune our preferences, and user inputs are completed, installation will begin.
This is typically the longest step in this guide since the entire operating system has to be installed on the virtual machine.

Keep an eye on the installer as option will change from "Cancel and Reboot" to only "Reboot" when installation is complete.
Once it changes, reboot the virtual machine.

## Step 6: Install and Setup the SSH Server

Upon reboot, you'll drop back into the same window on the Ubuntu Server command line.
You may have to hit enter/return to trigger the login screen.

Log in to your user and execute the following:

```bash
sudo apt update -y
sudo apt install ssh -y
sudo systemctl enable ssh
sudo shutdown now
```

These command perform the following:

1. Updates apt package manager to reflect available updates from source.
2. Installs the SSH server.
3. Starts and enables (upon future startups) the SSH server.
4. Shuts down the VM.

The VM window should close when it's finished shutting down.

## Step 7: SSH Into the System

Now, this step should reflect your usual workflow from here on out.

With VirtualBox open, click the arrow under "Start" and hit "Headless Start".
This option launches the virtual machine, but without the graphical window.
The VM launches in the background, which is perfect because we only need to interface with it via SSH from our host OS.

On your host OS open your local terminal emulator with an SSH client and SSH into the system (using port 2222 as an example).

```bash
ssh user@127.0.0.1 -p 2222
```

And... that's it!
Your development environment is ready to go!

You can now delete the ISO file and all installation files as well.

Some good commands to remember are...

```bash
sudo apt update # check for available updates
sudo apt upgrade # install available updates
sudo apt upgrade -y # installs available updates without confirmations
sudo reboot # restarts the VM
sudo shutdown now # shuts down the VM
```

## Exit

Like I had mentioned before, there are *many* ways at setting up an environment like this one.
However, this guide should work for many kinds of users who need a Linux development environment.
For this guide in particular, developers who do not like CLI editors like Vim or Emacs can use the remote access functionality of GUI-based editors, such as Virtual Studio Code.
There's a lot of options!

> Developers have varying preferences and workloads.
> Some need native access to GPUs, some do not prefer CLI, others work extensively in Unreal Engine and Android Studio, and every developer has their own, valid needs and desires.

Regardless, I hope this guide provides an easy-to-use and dependable sandbox for your development and engineering needs!
