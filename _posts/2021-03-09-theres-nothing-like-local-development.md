---
layout: post
title: There's Nothing Like Local Development
---

I spent the last two months switching between hundreds of remote development environments so you don't have to.
Well... okay, maybe not *hundreds*, but it sure felt like it.

Days of long compilation times, seemingly-frequent battery drain, loud fan noise, and inconsistencies between local and production OSes led me to solve my problems with laptop-based development.
Some solutions took the form of a compromise: headless [NixOS](https://nixos.org/) VMs, full-GUI [Fedora Workstation](https://getfedora.org/en/workstation/) VMs, etc.
Other solutions were uncompromising: a physical remote workstation built with PC parts, a shared remote system with multiple laptops, etc.

However, reflecting on these last two months, these "solutions" were a waste of time (kinda, sorta).
Washing away my worries with laptop-based development revealed large flaws with remote-based development that I did not take into account before my journey.
Without beating myself up too much, I *did* try to anticipate pitfalls with my new development workflows.
In fact, I anticipated enough pitfalls that this blog post would have been titled **"I'm Done With Laptops"** a month ago.
It was *that* close.

So... why the sudden change?
That's a drastic transition from **"#@$% Laptops"** to **"There's Nothing Like Local Development"**.

Spoiler alert: It's complicated.

## Remotely Similar Definitions

I'd like to help us both get through this blog post, so let's modify some established definitions to make this journey as smooth as possible.
These definitions are only valid within this blog post.
You can think of them like pre-pending your Bash and Zsh variables with `local`, or defining a variable within a scope, or... uh... just ignore me, actually.

- "Remote" development refers to not only *actual* remote development environments, such as physical servers and cloud-based VMs, but also to *internal* development environments that reside on/above the host OS.
  - For instance, [WSL2](https://docs.microsoft.com/en-us/windows/wsl/install-win10) can feel like a native development environment, but the architecture leverages a minimal VM, and a lot of networking tricks, to make it feel like one (e.g. accessing a WSL2-based webserver via localhost in your Windows 10 browser without manual configuration).
  - WSL2 would count as a "remote" development environment with this definition.
- "Native" or "local" development refers to writing software directly on the host OS, or running a VM on something like [Proxmox](https://www.proxmox.com/) or [ESXi](https://www.vmware.com/products/esxi-and-esx.html).
  - The reason why VMs on Proxmox, ESXi, etc. get a pass over WSL2 VMs is because they are the lowest level OS for feasible/realistic daily development. With WSL2, you have the *option* to develop natively on Windows 10.
  - Although, using a Proxmox or ESXi VM from another system counts as "remote development". I never promised this would make sense.

I wanted to be internally consistent when evaluating remote versus local development environments, so these definitions helped me decide what makes me happiest and most productive.

**TLDR**: if I can open a laptop lid (or boot a desktop with a monitor), open my editor/IDE and web browser, and get straight to work without any further configuration, it is probably a local development environment.
If I have to mount a filesystem, use SSH, change networking options, or download a remote extension for my editor/IDE, it is probably a remote development environment.

## Virtual Machines: The "Remote" Software Approach

I use a variety of development environments for my personal workflow/setup, so we are going to focus solely on the professional side of things.
These environments needed to facilitate writing and building containerized services in Go, and deploying those services to a local Kubernetes cluster via [Helm](https://helm.sh/).
That's a fairly low barrier to entry, especially since nearly all of my work is spent in userspace, Go programs are statically compiled, and that using [k3s](https://github.com/k3s-io/k3s) and [k3d](https://github.com/rancher/k3d) makes local cluster management easy.

This journey started when I wanted to revisit dedicated, headless, development Linux VMs on macOS desktops.
That desire arose from the following thoughts...

- "Using Docker in a Linux VM would be better than using Docker Desktop."
- "I miss using Linux for daily work."
- "I will be able to use `systemd` for deploying `k3s`, use kernel-specific libraries and services, and work closer to where Rancher apps will actually live in production."

Yes, these thoughts were only *tangentially* related to my local development frustrations, but I thought using a Linux VM may indirectly solve at least *some* problems.

I had NixOS on my list of Linux distributions to try for nearly a year, and with [@theprincessxena](https://twitter.com/theprincessxena)'s, [@mitchellh](https://twitter.com/mitchellh)'s, and [@dave_universetf](https://twitter.com/dave_universetf)'s recommendations, I began to use NixOS in my daily workflow.

Actually, using a NixOS VM was arguably my most successful "remote" development environment.
The reproducible builds are very important when using NixOS Unstable for the latest packages, even though I never encountered a single breakage.
Other than [Fedora Silverblue](https://silverblue.fedoraproject.org), I had never felt more confident in using a Linux distribution.
The stability and consistency are addicting.

> **What about Nix directly on macOS?**
>
> Before using NixOS, I tried Nix with [home-manager](https://github.com/nix-community/home-manager) on macOS.
> This setup was very effective, and it rivaled using [homebrew](https://brew.sh/) with a manual [dotfiles](https://wiki.archlinux.org/index.php/Dotfiles) setup.
> However, Nix creates a new [APFS](https://en.wikipedia.org/wiki/Apple_File_System) volume called `Nix Store`, which can be undesirable if you only intend to use Nix in a limited capacity.
> It would be incorrect to call Nix "invasive", but it is definitely "involved" since it requires more setup than a traditional package manager.
> Thus, I recommend trying Nix with `home-manager` in a VM, Linux or macOS, before using Nix directly on your desktop.

Sounds great, right?
Yes, but I never realized how integral [FHS-compliance](https://en.wikipedia.org/wiki/Filesystem_Hierarchy_Standard) was to my daily workflow. Sure, there were issues when using the [Visual Studio Code Remote Extension](https://code.visualstudio.com/docs/remote/remote-overview)...

```bash
[nick@nixos:~/dotfiles]$ strings /usr/lib64/libstdc++.so.6 | grep GLIBCXX
strings: '/usr/lib64/libstdc++.so.6': No such file
```

...but these can be remedied by mounting ("sharing") the guest OS's filesystem with the host OS.

The bigger problems arose when varying projects and applications relied on `PATH` to function properly.

> Please, let's discuss alternatives to the `PATH` concept at a different time.
> I can hear you ~~cheering~~ screaming!

**Bottom line**: I needed to be able to clone project repositories with minimal tweaking to get [make](https://www.gnu.org/software/make/) targets to work.
You might find this ironic, given the length of this post, but I decided that configuring symlinks, generating FHS-compliant configurations for NixOS, etc. would be too time-consuming for my daily development workflow.

It's worth noting that I *adored* NixOS for rapid teardown/setup environments and production deployments.
Definitely going to keep an eye on the NixOS community and project moving forward.

After NixOS, I tried some old favorites again in a VM: [Arch](https://archlinux.org/), [Ubuntu](https://ubuntu.com/), [openSUSE Tumbleweed](https://en.opensuse.org/Portal:Tumbleweed) and, of course, [Fedora](https://getfedora.org/).
From what I recall, Arch had the most usage due its fast package manager, rolling release model, and that [one of my projects was (and still is) in the AUR](https://aur.archlinux.org/packages/gfold/) (thanks [@orhunp_](https://twitter.com/orhunp_)).

Before we continue into distro madness, I'll remind myself that this post is not about Linux distributions.
It's about why **"There's Nothing Like Local Development"**.

> I am also *pretty tired* of talking about Linux distros, and would much rather talk about other things.
> Yeah... apologies, folks.
> It's not you, and it's not me either.
>
> \*glares in [r/unixporn](https://reddit.com/r/unixporn)\*

However, NixOS was worth diving into because the reproducible builds are very unique in comparison to macOS and many other Linux distributions.
Yet, the uniqueness ends there.
My experiences with the headless NixOS VM shared many similarities to headless VMs running my "old favorites".
The guest VM approach exacerbated battery drain, fan noise, and compile-time issues on the laptop, regardless of the distribution.
Running the virtual machine, alongside all the tooling and extensions required to interact with the guest VM from the host OS, was not an ideal solution to my problems.

Moreover, revisiting the "old favorites" reminded me that non-headless VMs (e.g. full-GUI, even with only a window manager) were not preferable.
While full-GUI VMs solve some issues encountered with headless VMs, they exacerbate my frustrations with local laptop development on the laptop even further.
Not to mention, there were drawbacks *unique* to this approach: hindered font rendering, using multiple web browsers (host and guest), and general resource wastefulness from running a full-GUI.

At this point, I had realized that the benefits of using a Linux VM did not justify including it in my daily workflow.
There was no tangible benefit to having a "remote" Linux VM directly running on my host OS.
If I needed a real Linux kernel, I could use "hypervisors as a service", like [Vagrant](https://www.vagrantup.com/), [VirtualBox](https://www.virtualbox.org/), [Hypervisor](https://developer.apple.com/documentation/hypervisor) frontends, etc. at a moment's notice.

> In fact, using desktop Linux would even further defeat the purpose of a "pet" Linux VM for full-time development.
> As a reminder, this Linux VM workflow experiment was conducted with a company-provided MacBook Pro.

Then it hit me: what if I could get the benefits of a dedicated, development, headless Linux environment while eliminating the detriments of using a laptop for development?
What if there was a *separate box* that I could access via SSH, [VNC](https://en.wikipedia.org/wiki/Virtual_Network_Computing), and [Cockpit](https://cockpit-project.org/)?
Folks, I might as well have discovered fire because it was time to build a remote development workstation.

## Workstations: The "Remote" Hardware Approach

The parts arrived days later.
With a Noctua CPU cooler in hand, it was time to benchmark ridiculously fast compilation times while generating noise in an entirely different room of my apartment.
After weighing a few Linux distributions, I installed [Fedora Server](https://getfedora.org/en/server) on the newly built system and got moving.

> **Side Story on Ethernet Drivers**
>
> There was [an issue with the 2.5G Realtek ethernet port](https://ask.fedoraproject.org/t/realtek-ethernet-not-working-on-32/8143/7) on my Z490 motherboard.
> This was patched in Linux 5.9, but the Fedora Server 33 ISO came with kernel 5.8.
> Yes, there were many reasonable ways to fix this, but I used my Pixel 4's USB-C tethering to deliver an internet connection to the system because it made me laugh.
> After a `dnf upgrade --refresh` and `sudo reboot`, the system successfully connected to the internet over ethernet with a 5.10 kernel.
> Got to love Linux.

Much like the NixOS VM, this development approach seemed perfect at first.
I could use a VPN to access my home network, and access my remote workstation easily.
The compilation times were *that fast*, and my laptop became *much quieter* than ever before.

> **Why not use a cloud provider and let them handle the hardware?**
>
> Something like a DigitalOcean Droplet or an Amazon EC2 instance would be enticing, but the recurring cost of a moderately powerful VM would be too high for daily development.
> I use VMs from cloud providers for persistent services, different platforms when I need them, and for ease of use during development.
> Requesting and decommissioning cloud VMs, depending on project, time of day, and time of year is *much* more cost-efficient than reserving a powerful VM persistently.
> Moreover, reduced compilation times are an unnecessarily expensive goal in the cloud when you have a moderately powerful laptop.

However, the issues began to reveal themselves over time.
Managing a remote system alongside your laptop increases your sysadmin workload by 100% (*which is also true for the aforementioned guest VM approach*).
Yes, an `upgrade + reboot` with your favorite package manager was all you usually need to do, but networking is where things got tricky.
Managing SSH keys was easy, but wrangling [firewalld](https://firewalld.org/) and setting up automation on my MacBook Pro proved to be doable -- albeit time-consuming.

> "I just want to generate and look at these docs using localhost and [Hugo](https://gohugo.io/)".
>
> "Oh no big deal.
> Just use [ngrok](https://ngrok.com/), change this [SELinux](https://www.redhat.com/en/topics/linux/what-is-selinux) policy, ensure that CSS is being forwarded from `localhost`, and you are good to go!
> Also, don't forget to stop your docs webserver or `ngrok` service.
> If you're not using `SELinux`, you have even less work!
> You now only have to worry about your system's firewall settings, latency between systems, and-"
>
> "Or... I could just execute `make run` on my laptop..."
>
> "Yeah... or that."

The issues with my remote workstation were never matters of ability, but matters of feasibility.
It was never the case that using `k3d` via SSH was meaningfully different than using it on my laptop's host OS.
Networking edge cases when using the remote system became more apparent when actual "remote" hardware came into the mix, rather than just using a guest VM on the laptop.

Speaking of which, [neovim](https://neovim.io/) and [tmux](https://github.com/tmux/tmux) only took me so far, and [GoLand](https://www.jetbrains.com/go/)'s remote extension proved to be useful, but not as useful as using a local filesystem.
Thus, it was time to try [macFUSE](https://osxfuse.github.io/) with [SSHFS](https://github.com/libfuse/sshfs) to mount the remote filesystem for development.

I stepped back and paused... this a lot of effort to work with a remote system.
I reminded myself: battery drain, long compilation times, and fan noise were my primary drivers for this journey.
I was still determined, but it was time to think about this physical server-like approach differently: what if I only used VNC, RDP, [XRDP](https://github.com/neutrinolabs/xrdp), or [NoMachine](https://www.nomachine.com/) and avoided networking issues altogether?

LOL... that didn't work either.
I not only tried some of my favorite Linux desktop distributions; I even tried Windows 10 Pro with WSL2 over RDP.
The problem is that while the laptop was quieter and ran smoother than ever, the visual degradation and network latency were severe with a remote desktop environment.
Native, local performance is unbeatable for GUI applications, full stop.
Over SSH, the threshold for manageable lag is *much* higher than over protocols like VNC.
The latency would be passable in a pinch, but not for 40 hours per week.
Thus, pushing a full-desktop environment remotely quickly became unappealing.

> **Why not use the workstation locally?**
>
> This is a reasonable question.
> For some full-time, self-employed "open-sourcers", this might be the right approach to daily development.
> For me, I only wish to sign into company services and applications from the company-provided laptop.
> I would rather take one laptop over one workstation in this context.

If these compounding issues were not enough, the environmental impact of this setup began to become more and more apparent.
Would I have to keep this system on 24/7 when traveling?
What if there was an outage?
Is this a waste of hardware given how infrequently I actually compile and run my code?
Of course, the power usage would be minimal with average US electricity prices, but I began to view this remote workstation as "wasteful", nonetheless.

Alright, well, what about going back to VMs?
Virtual machine platforms provide directory sharing with the host, port forwarding via NAT, and other solutions that make "remote" work easier.
However, I am still managing *another* system in a full-time capacity with this approach.
Even though guest VMs strike a compromise between truly remote systems and native/local environments, setup and maintenance are still required for daily use -- even if the impact is minimal.

It was at this point that I realized that, over *two months*, I spent too much free time tweaking/trying these setups on weeknights and weekends.
The intention was to write code.
The intention was to clone and test open source projects.
The intention was to spend time on developer productivity and happiness.

Well, I lost the plot.
I learned a lot, but admitted to myself that this experiment was a failure.
That's okay!
I was fine with that admission, yet... I *needed* to figure out what happened.
Where did the original intentions slip?

## Local Development Happiness

Let's step back and look at my primary issues with local development on a laptop:

- Long compilation times
- Fan noise
- Battery drain
- Inconsistencies between host OS and production OS

You might have noticed something throughout this post: I did not include the *frequency* at which I hit these issues anywhere.

- How often do I actually compile code?
- How often do the fans actually get loud? (without the snarky answers for specific applications)
- How often does battery drain actually matter at a desk or table with a power outlet nearby?
- How practical is it to match your local OS with the OS your services use in production, and how often am I using kernel-specific features?

My answers to these questions included the phrases: "not often", "not practical", and "not realistic".
Granted, these *are* absolutely valid complaints for local development on a laptop.
Every one of my solutions tried to answer at least one of these questions, if not all of them sometimes.

> **A note on matching local and production OSes**
>
> When I say "inconsistencies between local and production OSes", I do not explicitly mean writing Linux-specific software on a non-Linux desktop OS.
> Runtime testing is important, but it is entirely valid to cross-compile when possible and create VMs on the fly, depending on the use case.
>
> I firmly believe that choosing a host OS should be based on productivity and happiness rather than architectural proximity to your production environment.
> If your productivity and happiness are derived from using an Ubuntu Desktop for developing apps that are deployed on Ubuntu Server, that is entirely valid.
> There is a measure benefit in matching both environments.
> On the other hand, unless development is platform-locked, like iOS application development, choosing your desktop OS does not have to be driven by your production environment.

Things I took for granted with local development became apparent over the past two months.
My dotfiles, editor, IDE, browser, and command-line apps all live  on my laptop now -- just like before this experiment began.
I love having everything in one place.

I took native desktop and CLI applications for granted.
Docker Desktop may demand a lot from my host system, but the ability to execute `docker run` and `k3d cluster create`, and to access everything I need to on `localhost` without any additional configuration, is an experience that "remote" development cannot match for me.

Of course, I still need create S3 buckets and EC2 instances in the cloud, but they are only *extensions* of my daily development workflow.
These things are nothing that [rke](https://github.com/rancher/rke) or [terraform](https://www.terraform.io/) cannot solve.

Regardless, I had to remind myself that the [majority of developers use Windows 10](https://insights.stackoverflow.com/survey/2020#technology-developers-primary-operating-systems) and, most likely, only have access to one device: a laptop.
I was hyper-optimizing a development workflow that is simply an impossibility for many folks in the world to access.
Even at 45W or 15W, a new Core i5/i7/i9, Ryzen 5/7/9, or M1 processor will absolutely excel for the vast majority of software development.
When you do need that heavy lifting, the local workstation or cloud provider service can suffice, but how often do *most* developers need that muscle?

The battery will drain, the fans will spin, and the compile times will be "long" (read: not really), but the ease of use and accessibility will be front and center for local development, which are essential to the software development experience.
At the end of the day, maximizing my time writing code, collaborating with co-workers, blogging, and researching new projects, and minimizing my time managing my system and "solving" lower priority issues are what make me happy and productive.

For all of these reasons, I returned to local development with my company-provided MacBook Pro.
It's what I continue to use now, during the workday.
My local development preference remains the same, regardless of the OS.
If the company-provided laptop becomes a [System76](https://system76.com/) Lemur Pro or a Microsoft Surface Laptop 3, I'll still be focused on writing code directly on the host OS of the physical device.

This post is a self-reflection in developer priority management and identifying pitfalls when optimizing my workflow.
However, I'm also not going to dunk on myself: the motivations behind the experiment were clear and well-founded.
I want to do the best work I can, as efficiently as I can, and with as much developer happiness as possible.

This was a learning experience, and it's one that I'm happy with its conclusion.
I hope that my experiences, self-owns, and ramblings helped convey my message: **"There's Nothing Like Local Development"**.
