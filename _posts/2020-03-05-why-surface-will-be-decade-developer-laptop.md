---
layout: post
title: Why The Surface Will Be This Decade's Developer Laptop
---

The 2010s marked the decade of MacBook Pro dominance.

Articles and blog posts raved about OS X (fellow [Zoomers](https://www.merriam-webster.com/words-at-play/words-were-watching-zoomer-gen-z), this was macOS's old name).
Not only was the software rock solid, but so were the laptops it shipped on.
Operating system updates were *free*, which was an industry first for non-free software.

> ### March 2021 Update
> 
> Reading back through this post reminds me that I was unclear about one thing: who is the Surface Laptop for?
> At the time of this post's publication and now, it's not for me, but that does not mean it will not be for others.
> I may have implied this in the section containing the following: "I was alternating between Windows 10 and native Linux installations (Ubuntu/Debian/Fedora/PopOS!) before this news".
>
> [45% of developers use Windows as their primary operating system](https://insights.stackoverflow.com/survey/2020#technology-developers-primary-operating-systems), and the intention of this post was to imply that "This Decade's Developer Laptop" will not necessarily be the *best* developer laptop, but that it *could* fill the shoes that the late-2000s/early-2010s MacBook did.
> Could the Surface Laptop become the default option in Silicon Valley blog posts about the "best laptop"?
> That was the question this post tried to answer.
>
> This post followed persuasive writing styles from academia, which might have accidentally misrepresented my personal stance on "This Decade's Developer Laptop".
> I am always trying to reduce the ratio between my intentended arguments and how my blog posts are perceived.
> Thus, while this was one of my most popular posts, if I had to write it again, I would ensure that this post more *exploratory* than *convictive*.
>
> ### July 2020 Update:
> Apple's WWDC this year was incredible.
> The pivot to ARM-based Apple Silicon and macOS 11 was very reassuring, as a Mac fan.
> Moreover, the MacBook Air and MacBook Pro 13-inch have been refreshed since this article was posted, and have addressed most of the 2016-2019 lineup's issues.
>
> I think the core message of this article still stands: Microsoft has a potential winner on its hands with the Surface lineup.
> Let's see how this plays out over time.

Every time Steve stood onstage at WWDC, every developer tuned in to listen to every innovation at both the hardware and the software level.

It's pretty easy to see why in the era of...

- Tools relying on UNIX-like philosophies
- Windows blunders (read: 8 before 8.1)
- Ruby on Rails, Javascript frameworks/runtimes, and many more macOS/Linux native web tooling
- Linux-powered infrastructure and cloud
- iPhone 4 (2010) beginning the astronomical drive into iOS app development
- OSS from passionate communities using UNIX-like toolchains
- Apple's amazing hardware with a stable operating system
- An ecosystem connecting your Apple devices seamlessly

...and the list goes on.

However, many developers have come to recognize the honeymoon [might be over](https://hackernoon.com/why-developers-should-not-use-macbook-pro-3b6a4aeeee64).

Why though?
What has Microsoft done to make Windows 10 (and its Surface lineup) so attractive for software development?
It's time to time travel!

## A Series Of Very Fortunate Events

A quick note: this is an abridged history and the teams over at Microsoft do *so* much more than I have indicated here.
As a user of all three major desktop platforms, I've picked the events that stuck out to me.

I'd love to talk about Azure, Xbox Game Pass, gaming on Windows, Surface Neo, and more.
However, in the interest of time, I will tightly constrain this to the most relevant events to a former MacBook Pro owner.

### February 4th, 2014 - Satya Nadella Announced as Head of Microsoft

The 14-year reign of Steve Ballmer has ended. 
The everyday software engineer probably shrugged and continued on with their lives, but high-school-Nick holds onto his Windows 8.1 gaming PC for dear life in the hopes that new leadership would help knock Windows 10 out of the park.

### August 2nd, 2016 - WSL Introduced via the Anniversary Update

Windows 10 had a decent start, but it wasn't until the Anniversary Update that online discussions about migrating to Windows 10 began to spur up (absolute anecdote).

WSL ships in this release, and the winds of change begin to brew.
Reddit, Twitter, and HN are filled with doubters wondering if Microsoft had nefarious intentions with the platform.

However, there are many that are warming up to the "new Microsoft", even if this move appears as "too good to be true".
You can install OpenSSH and your favorite Linux tooling in a pinch.

Does it replace your entire macOS or Linux workflow?
No, probably not.
However, it's a great starting point for the "new Microsoft".

### May 2nd, 2017 - Surface Laptop Announced

This is the first part of the article where I actually mention our star of the show.
That's intentional.

While the first Surface device was announced in all the way back in 2012, it's been quite the rough journey to get to this point.
With headlines like ["Steve Ballmer Admits Microsoft’s iPad-Killer Is A Flop
"](https://www.cultofmac.com/237379/steve-ballmer-admits-microsofts-ipad-killer-is-a-flop/), it's safe to say that this device family was struggling.

Five years go by with increasingly successful launches, a growing user base, and, finally, the Surface Laptop is announced.

A beautiful non-2-in-1 laptop, with a *better* aspect ratio (3:2) than the MacBook Pro, great build quality, a great keyboard, and a very good touchpad.

Alright, great.
We have WSL and a MacBook-like laptop now.
You can see where this is going.

### October 17th, 2017 - Linux Distro Images in the Store

Canonical's Ubuntu was not the only Linux distribution to get adopted into the WSL program.

This milestone does not seem that important at first, but when Microsoft is including OSS community favorites, like Arch Linux, in its store... you begin to see the faces of doubt turn into faces of surprise... and then into faces of newfound optimism.

### January 22nd, 2018 - OpenSSH in Windows 10

Native OSS tooling in Windows.
Many never thought that they would see the day.

If you SSH into boxes at work and use tools like Vim and Tmux to do the heavy lifting, then OpenSSH is a *vital* tool.

This is not groundbreaking, but it makes the developer experience *that* much better.

### April 13th, 2018 - Copy and Paste for WSL Consoles

Yeah... I mean this is important but... I get it.
It's boring.

### December 6th, 2018 - Microsoft Announces Chromium-Powered Edge

While some might fear the duopoly of the Gecko-powered Firefox browser and nearly every other browser being powered by Chromium, Microsoft recognized that it was their time to bow out of the browser engine arms race.

I actually loved Edge when I first used Windows 10.
Of course, I ran other browsers primarily, but the battery life and ease of use was acceptable for a default Windows browser.

However, it was never going to replace a daily driver like Firefox or Chrome.
Perhaps, this plan will result in a competitive full-time use browser?

We'll come back to this later.

### May 2nd, 2019 - Remote Development with VS Code, Including WSL Support

A relatively quiet 2018 was followed by three huge announcements in one week!

Want to use VS Code on any system at work and at home? No problem.

The remote development extension is a huge add-in to the increasingly popular, free and open source, Visual Studio Code.

It also works directly with WSL, allowing for native-like editing of files on your Linux image.
If you use extensions leveraging installed languages, like Go and Rust, you can use their installations on WSL instead of Windows.

That's a killer feature and you only need to keep WSL's binaries up to date.
Just one button in VS Code and you can work with your entire WSL system.

To be transparent: I am a vim/[neovim](https://neovim.io) user, so this was not directly relevant to me.
Regardless of my personal editor of choice, this is a major win for a ton of engineers and developers.

### May 6th, 2019 - Windows Terminal Announced

They have a [got damn trailer for a terminal emulator](https://www.youtube.com/watch?v=8gw0rXPMMPE).
It's the most unnecessary, necessary thing that I have ever seen.
And it is *awesome*.

You like iTerm 2, GNOME's terminal, or Apple's default terminal?
You want this.

Some believe that the new Windows Terminal has only caught up with present-day competitors, but it's better late than never.
Yet, with features like GPU-acceleration and total customization, this tool packs a punch.

Like many things on this list, the addition of the new Windows Terminal might seem minor on its own, but is also more impactful than one might expect.

### May 6th, 2019 - WSL 2 Announced

Three days later and we get WSL 2.
While Microsoft has not expressed interest in deprecating WSL 1, I fully believe that WSL 2 will completely replace it.

It's powered by an onboard, hyper-tuned Linux kernel (shipping with Windows 10?!) via Hyper-V Type 1 virtualization. At a high level, this means you get native Linux development on a Windows 10 machine.

Now, we are starting to get into features that macOS explicitly *does not have*.
While macOS is UNIX-like, most of the cloud and on-premises servers run Linux.
WSL 2 provides a way to natively develop on your enterprise's favorite distributions that the BSD-backed macOS (though, I love you BSD-based OSes) simply *does not provide*.

This is a huge deal.
Previously, I would use VirtualBox or VMWare Fusion when working on OS-level software on my MacBook Pro.
While I'm unsure that WSL 2 has received the stamp-of-approval for kernel development, it's a lot closer than native macOS is.

"Isn't that cheating? Using someone else's userspace rather than your own?"
Docker Desktop for macOS and Windows uses a miniature Linux VM to work.
We've already been doing that.
It's fair game!

### August 27th, 2019 - Windows Terminal Comes to the Windows Store

Originally only available as a GitHub release, the Windows Terminal (v0.4) becomes available for everyone via the Microsoft Store.

Even for the power users who manually download GitHub releases, the versioning, upgrading, and software management of the Store isn't to be underestimated.

Enterprise adoption starts with native-application management and a path towards general availability.

### September 18th, 2019 - Cascadia Code Releases

Another small, but fun and potentially underrated release.

Does macOS look pretty?
Well, now Windows is starting to look pretty too.
It's the little things.

Since its release, Cascadia Code has been my goto font for everything monospace.
Fira Code and Monaco are great, but Cascadia code adds another great developer "nice-to-have" to the Windows toolbelt.

### October 2nd, 2019 - Surface Laptop 3 Announced

The Surface Laptop, Surface Pro and Surface Book were all close to feature-parity with heavyweights like the MacBook Pro, XPS 13, and X1 Carbon.

However, the Fall 2019 Surface Event showcased Microsoft's commitment to polishing the Surface lineup with features like USB-C, AMD Zen 2 Ryzen CPUs, Intel 10th Gen Core CPUs, and a trimmed design on the Surface Laptop 3, in particular.

- Sure, the XPS 13 might be the better laptop.
- Sure, the MacBook Pro 16-inch has improved the current generation's pitfalls.
- Sure, the X1 Carbon might be a tried and true, bulletproof tank.

However, in comparison to the other Windows laptops, the Surface Laptop 3 offers native updates and drivers, just like a MacBook Pro.

Against the MacBook Pro, the 3:2 aspect ratio is a major advantage that makes Apple's 16:10 aspect ratio look a tad conservative.

The Surface lineup is not aimed at competing with value-efficient XPS devices.
It's aimed at the MacBook market: first party, easy software management with first party, kickass hardware.
For that market, I believe that the Surface Laptop 3 is Microsoft's best attempt yet.

### November 4th, 2019 - Rising Developer Interest

Whenever [DHH](https://twitter.com/dhh) weighs in on a tech topic, the Twitterverse starts chirping.

On this day, the creator of Ruby on Rails, and CTO at Basecamp, posted about his experiences [using Windows after 20 years](https://m.signalvnoise.com/back-to-windows-after-twenty-years/).
While he ended up returning the Surface Laptop 3, he "would absolutely give Windows another try in a few years".
Not a bad endorsement from a well-known macOS user.

David pointed out a glaring issue with the new Windows 10 developer toolkit: bleeding edge tech.
It's no secret that WSL 2, Windows Terminal, Cascadia Code, and Docker Desktop require more than a few hoops to get working.

So... how do we address that?
Well, with two things: community hype and the eventual Windows 20H1 release.

Great community voices like [Scott Hanselman](https://twitter.com/shanselman), [Craig Loewen](https://twitter.com/craigaloewen), [Kayla Cinnamon](https://twitter.com/cinnamon_msft), [Hayden Barnes](https://twitter.com/unixterminal), [Nuno do Carmo](https://twitter.com/nunixtech), [Jen Gentleman](https://twitter.com/JenMsft), [Iheanyi Ekechukwu](https://twitter.com/kwuchu), [Brian Ketelsen](https://twitter.com/bketelsen), and many more have been *extremely* influential in the Windows development community.
In fact, they have been some of the most responsive and helpful voices in the *entire* software development community.

Let me keep the record straight: these folks have been passionate community voices for a *long* time; before WSL 2 existed.
However, I believe that the recent intersection of developer worlds may have amplified their generous contributions to even wider audiences than before.

The second thing: Windows 20H1, the first of two major Windows 10 releases in 2020.

I'm not sure if this was perfectly planned, but landing exactly on 2020 is not a bad way to kick off a new decade of developer market dominance.
WSL 2 and Terminal will hit GA (general availability) with this release.
This release will be the convergence point for Microsoft's development tooling.

### November 11th, 2019 - WSL2 Reaches Slow Ring for Insiders

We are getting closer.

The barrier to entry is lower than before since slow ring users have very similar experiences to non-enterprise, stable Windows 10 users.
WSL 2 is even more accessible than before.

### January 15th, 2020 - Chromium-backed Edge Hits GA

Before Windows 20H1, Microsoft releases the production ready, new Edge browser.

The push and pull between the online Chrome and Firefox communities revolved around conversations like Chrome having better performance and Firefox having better privacy defaults.

On my machines, I spent 2019 alternating between Chrome, a performance and UI dream, but a resource hog and privacy/pop-up annoyance, and Firefox, which was almost the opposite experience for me.

Microsoft seems to have threaded the needle with a browser that has better battery life than either Firefox or Chrome, but is nearly as (if not more) performant.
As for privacy standards, they might not be as strong as Firefox's, but I think it's safe to assume that they are *probably* stronger than Chrome's.

This is also the first Microsoft browser to hit macOS in 13 years!

Back in late 2018, it was difficult to see why Microsoft was putting the effort into overhauling Edge.
Now, it makes much more sense: give people the power, speed and confidence of Chrome with the battery life, and native integration of pre-Chromium Edge.

### February 13th, 2020 - Terminal v0.9 Release, the Last Before GA

The Windows Terminal has been compounding a bunch of great updates leading up to v0.9.
This was the last update before v1.0, which ships with update 20H1 alongside WSL 2.

The amount of polish put into Terminal since May 2019 implies that the GA release will be ready for primetime.

### March 2nd, 2020 - Docker Desktop for WSL2 Works with Windows 10 Home

I'll tell the truth.
I was alternating between Windows 10 and native Linux installations (Ubuntu/Debian/Fedora/PopOS!) before this news.

My biggest problem with this entire development workflow was the need for Windows 10 Pro.
Sure, the cost might be justified when compared to the price of the MacBook.
However, it is not a great experience when you buy a Windows laptop and then have to pay again to use Docker Desktop.

I need to have a local Kubernetes cluster, and without Minikube, Docker Desktop for Windows (powered by WSL 2) is the best way to do it.

I never felt fully comfortable with WSL 2 on Windows 10 Home for this reason.
Since I was unable to create a local, single-node cluster, I alternated between using VMs, native Linux installs, remote instances, you name it.

With this monumental change, I am here to stay with WSL 2 on Windows 10 for the foreseeable future.

The cloud-native workflow has hit Windows.
At this point, *many* more development workflows can work on Windows than ever before.

## Beneath The Surface

The value of a timeline lies not in the individual events, but in the trends and patterns that they reveal.

Take any of the above actions on their own, and yeah, they're pretty cool efforts by Microsoft, but you may miss the overall trend: disrupting the developer market.

In a span of 6 years since Satya's appointment to CEO, we now have a MacBook Pro equal, the ability to develop native Linux applications on Windows, and a great default toolkit (Windows Terminal/Chromium Edge/Cascadia Code/VS Code Remote).

That's not to say that Microsoft's plan is foolproof.

- Apple's 16-inch MacBook Pro is a step in the right direction, and 2019's thicker iPhones with bigger batteries and modular Mac Pro were indications of significant shifts in Cupertino.
- The MacBook will always have it's UNIX-like, BSD-based operating system, which is simply a (mostly) easier development experience than native Windows.
- Apple's rumored in-house ARM processors for the MacBook Pro may help charge the PC industry into a future where [Ampere](https://amperecomputing.com/) is already living in.

However, I unsure that Apple will catch up right away.
WSLConf is next week and Microsoft might be holding even *more* straight flushes in their hand.

To put it bluntly, team MSFT is kicking ass and is doing a phenomenal job at getting developers to consider Surface lineup devices as their daily drivers.
I don't think the work is done though.

Seeing how Windows 20H1 pans out in the next month or so will be *vital* for the development community.
While the bleeding edge software has been great so far, stable, generally available software is what gets into the enterprise.

However, for academic, personal, remote, and smaller enterprise use, the Surface with WSL 2 is the best laptop for developers right now.

If Microsoft keeps this up, that will be true for the decade.
