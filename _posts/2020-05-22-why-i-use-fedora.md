---
layout: post
title: Why I Use Fedora
minutes: 5
---

Cue the dramatic music and dim lights: it's October 2018.

- the 28th: [IBM to Acquire Red Hat](https://newsroom.ibm.com/2018-10-28-IBM-To-Acquire-Red-Hat-Completely-Changing-The-Cloud-Landscape-And-Becoming-Worlds-1-Hybrid-Cloud-Provider).
- the 30th: [Announcing the Release of Fedora 29](https://fedoramagazine.org/announcing-fedora-29/).

Busy week, huh?
Ironically, it was the week that I began to use Fedora.
I choose Fedora that week just because it was the "next one on the list"... and because of a headline that I'll go over later.

I've [distro hopped](https://www.reddit.com/r/DistroHopping/) for years before that.
In fact, I still do.
Yet, there's just *something* about Fedora that has kept it my rotation from Fedora 29 to Fedora 32, which recently released a few weeks ago.

So... let's talk about it.

## Blue Hat

Fedora is a community-driven, Red Hat sponsored, Linux desktop-oriented distribution.
I've been driving it on at least one bare metal machine or VM since Fedora 29, which equates to about a bit over a year and half of daily usage.

Honestly?
I've generally loved my time with it.

Giving an unbiased review is an oxymoron.
In my opinion, transparent biases make for a better review.
Knowing that a music reviewer prefers novelty to cultural influence, or that a laptop reviewer prefers keyboard quality to screen (panel) quality, provides a frame of reference for their respective reviews.

Only thing is: I'm not formally reviewing my experience with Fedora 29, 30, 31, and (so far) 32.
This is more of a "what-does-Fedora-have-or-do-for-me-that-other-Linux-desktop-distributions-do-not" post.
Those exist, right?

## Gravitation

For transparency's sake and quality assurance, I'll kick this off with the following: I value well-designed, high quality software before Free and Open Source Software (FOSS).

I know, I know.
I hear you orange sites!
Let me explain.

FOSS is usually a substantial portion of my "well-designed, high quality" software of choice.
However, this personal preference has been a primary driver in using MacBook Pro throughout college, and running Windows 10 on my gaming PC.

That's not to say that open source and open standard technologies aren't important to me.
In fact, I believe that they will continue to displace proprietary solutions.

Kubernetes is the present day example.
The open standard ISA, [RISC-V](https://en.wikipedia.org/wiki/RISC-V), and the open firmware platform, [coreboot](https://www.coreboot.org/) may be blueprints for the future.

So, what the hell does any of this have to do with Fedora?
Focus and vision.

## An Upfront Focus

*"Fedora Workstation is a polished, easy to use operating system for laptop and desktop computers, with a complete set of tools for developers and makers of all kinds."* -[getfedora.org](https://getfedora.org/)

Under the leadership of [Matthew Miller](https://twitter.com/mattdm), the awesome teams behind Fedora, and its great community, this distribution has streamlined itself in recent years.
Sure, the [Fedora CoreOS](https://getfedora.org/en/coreos) project and [Fedora Silverblue](https://silverblue.fedoraproject.org/) projects present unique opportunities, but they differentiate themselves by *use cases*, not *desktop spins*.
(Although, you can choose different, unofficial desktop spins if you would like.)

I like my desktop to work out of the box.
A singular, consistent vision for desktop design is very important to me.
Of course, I've loved my time with window managers like i3 and Sway, as well as desktop environments like KDE and XFCE, but consistency and focus in a distribution are important for *me*.

Do my preferences dismiss distributions, like Arch Linux?
No, actually.
Arch's KISS design is prevalent and well-explained through its [extensive wiki](https://wiki.archlinux.org/).
Thus, I really like using that distro when it makes sense for me.

However, *when using a laptop*, my preferences sway towards hardware support, some industry presence, and a singular vision at the GUI-level.
This generally leaves me with Ubuntu, Pop!\_OS, and, of course, Fedora.

I have great things to say about the above distributions (and many more), but I have unique and specific reasons for using Fedora.

## Vanilla Isn't So Vanilla

Ubuntu's Dash to Dock integration is welcoming to users of all kinds.
Pop!\_OS' Pop Shell is a power user's dream.
I'm actually writing this from a system running Pop!\_OS 20.04.

Yet... I admire the Fedora team's insistence on using vanilla GNOME.

Fedora 29 was the first Linux distro where I felt like I didn't have to install GNOME Tweaks (GNOME Tweak Tool).
I opened the settings, chose some preferences, and went to work.

From the Fedora team's close working relationship with the GNOME team, I have confidence that new releases of the desktop environment will integrate nicely with the disto underneath.
I'm not any less confident in other distributions to deliver quality releases, but the partnership between the Fedora team and the GNOME team gives me *that* much more confidence in my OS.

This vanilla nature extends to the rest of the operating system.
The ["Is Fedora For Me?"](https://fedoraproject.org/wiki/Is_Fedora_For_Me) page highlights commitments to keeping upstream pure, providing sustainable updates, and upholding advancements in FOSS.

We will get to FOSS later, but let's talk about upstream and everyday usage.

## Hey, I Have To Actually Do Work On This Thing

TLP can often be a necessity for "Linux on the laptop" users.
When the news broke that [TLP was no longer needed for Fedora users](https://www.omgubuntu.co.uk/2018/02/better-battery-life-on-fedora-linux), the distribution immediately caught my attention.

Flicker-free boot shipped with Fedora 29.
Your hardware's OEM logo flashed on the screen, just like Ubuntu 20.04 LTS does now.

I noticed the "quality of life" changes more and more as I used Fedora.
Over time, I began to see them appear in other distros.

A lot of changes that eventually reach most distros start with Fedora.
Even between 6 month releases, updates occur frequently.

Well, wait...
What about stability?

I've mentioned the partnership between the GNOME team and Fedora team above, and I think that trend extends into many other components of the distro.
Teamwork doesn't ensure quality, but it most definitely helps.

- Red Hat sponsorship
- Kernel contributors following Linus Torvalds' lead in using Fedora
- Rapid systemd updates
- Frequent kernel updates
- A good balance between a completely static 6 month release-model, and a rolling release-model

A clear vision, good frameworks for teamwork, and a balanced release cycle are what make Fedora stand out amongst other distributions.

...and I haven't mentioned FOSS?!

## Free and Open Source Software

As far as my personal beliefs go, Ubuntu and Pop!\_OS actually align more closely to them than Fedora does.
If Nvidia's proprietary driver is well-designed and significantly better than the FOSS alternative, I'll use it.
Would I prefer the open source alternative, if it was nearly performant and consistent?
Yes.

However, many folks reading this feel strongly about FOSS, and I *highly* respect that.
Fortunately, Fedora does as well.

["Do you care about sustainable progress in software freedom and innovation?"](https://fedoraproject.org/wiki/Is_Fedora_For_Me)
This distribution does not ship with non-proprietary software (*note: I'm unsure if there is an edge case, but AFAIK, it's FOSS-friendly for legal and idealistic reasons*).

Personally, I use RPMFusion and install packages, like multimedia codecs, to get the "best" (subjective-ish) software I can.
While the Fedora project holds FOSS as fundamental value, their documentation helps users [interested in RPMFusion](https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/).
This process is entirely optional too.

I'm just happy that I can enjoy a Fedora release alongside 100% FOSS-driven users.

## Hats Off

I cannot cover everything, nor will I try to compare and contrast my experiences using Fedora to using other distributions.
Trying to draw lines between your motivations and the software you use is... actually more difficult than you would think.

"Why do I use \<INSERT THING\>?"

"I dunno. My professor though it was dope."

Maybe, I'll do a post on Ubuntu, Debian, Pop!\_OS, Arch, WSL2, etc. in the future.
It depends on how much time my significant other and I play Animal Crossing together.

However, it's my hope that this post laid out why I use Fedora, and why you might as well.
I recommend trying out every distribution in this post, but when in doubt... give Fedora a try!

