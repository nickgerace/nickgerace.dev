---
layout: post
title: Fedora Silverblue for Rust Development
---

This month was a lot busier than expected, including things that were [much more important than software](https://nickgerace.dev/post/action-and-experience).

Instead of editing, polishing, publishing a lengthy blog post, I opted for a "Tweetstorm"-style post in its place.
Here's my experience with using Fedora Silverblue for Rust Development.

## Tweetstorm Begins

This month was a lot busier than expected, so instead of publishing a blog post on using Fedora Silverblue for Rust Development, I'll be writing this thread instead 🧵. Let's go!
(cc: [@teamsilverblue](https://twitter.com/teamsilverblue), [@rustlang](https://twitter.com/rustlang))

I recently wrote about why I use Fedora, among other Linux distros. After posting that article, I thought "wait... have I even tried Fedora Silverblue before?" Distraught in my failing Fedora evangelism, I quickly downloaded the ISO so that I could feel validated.

Jokes, aside I drove the immutable desktop OS in a virtual machine, and I have to say... it's awesome.

However, I didn't really try this out for daily use. There have been many awesome posts about using containerized, GUI applications (Snap, Flatpak, Docker, etc.). For instance, 
[@jessfraz](https://twitter.com/jessfraz)'s 2015 post is an amazing example on how to get started. ([link](https://blog.jessfraz.com/post/docker-containers-on-the-desktop/))

Instead, I looked for "edge cases", and by "edge cases", I mean "compiling big ass Rust projects". My objective was to find the limitations, and workarounds, required to develop systems-level software within Fedora Silverblue. Can you replace your workstation OS with Silverblue?

We'll get to that. The first thing I wanted to do: understand the differences (and when to use) flatpak, toolbox, and rpm-ostree. I usually followed this order...

1. flatpak
1. toolbox
1. rpm-ostree

For my Rust toolchain, I primarily used Toolbox. ([link](https://docs.fedoraproject.org/en-US/fedora-silverblue/toolbox/))

Toolbox worked great! Sometimes, I even forgot that I was working in a container. Although, I did not benchmark build times, as this work was being done on an i7-8565U, which is already in the "eh whatever" build time arena.

Rustup and cargo worked out of the box. Great.

However, ```cargo install exa``` failed initially. Once I installed Fedora's equivalent to "build-essential" ("Development Tools and Libraries"), installing smaller Rust projects worked well.

Our first attempted build of Redox OS broke upon running out of space in the root partition. After some searching, and performing fdisk commands, an ```lvresize```, and a ```pvresize```, we were back on track.

You'll learn a lot about LVM when using Silverblue!

I've never had that experience when using other distros, but part of the magic to Silverblue is its tight organization. You can learn more about reproducible builds, and the OS design, here: ([link](https://docs.fedoraproject.org/en-US/fedora-silverblue/))

A few trials and errors with building Redox OS led to installing several packages and tooling libraries. While obvious to some, the Toolbox container is much more barebones than Fedora Workstation. I think that's a great thing, but it's something to keep in mind.

I did not get Redox OS to fully build, but the remaining failures were at the very end. I only gave myself one or two hours per project because I wanted to maintain pace.

Good news though: I think a little more time, and it would have built successfully (and launched with QEMU).

Building Krustlet worked flawlessly, but I was less fortunate when building Firecracker. That's because Firecracker is based on Docker, not Podman (+ Buildah). ([link](https://github.com/firecracker-microvm/firecracker))

Rather than disabling cgroups v2, and installing Docker, I decided to use Podman instead. Fedora Silverblue leverages containers for everything, so I wanted to keep the lower level stack as clean as possible.

I replaced every instance of ```docker``` with ```podman``` for Firecracker, and... WHAT, IT WORKED?!

```
Compiling firecracker v0.21.0
Finished dev [unoptimized + debuginfo] target(s) in 53.08s
[Firecracker devtool] Build successful.
[Firecracker devtool] Binaries placed under REDACTED
```

I could not believe it. All it took was adding "docker (dot) io" in some places, and performing a ```:%s/docker/podman/g```.

Granted, I am not saying that this will work for all projects, but I was pleasantly surprised with the result here. ([link](https://developers.redhat.com/blog/2019/02/21/podman-and-buildah-for-docker-users/))

Local Kubernetes development was not as simple. Minikube offers an experimental Podman driver, and podman can simulate Kubernetes workflows. However, using kind, and many other Kubernetes tools, requires Docker and cgroups v1.

While container runtimes for Kubernetes have little to do with Silverblue, or Rust, in particular, I think the developer experience there is still worth mentioning.

Ending on a high note: it all (mostly) worked. Were the builds as fast/painless as your everyday distro? Probably not. Was that my fault? Probably so.

Upfront, if you run a sound LVM setup, and a Toolbox container setup script/playbook, you may not even notice the difference.

This thread only covered the edge cases too. In exchange for a slightly more difficult systems-level building experience, you get reproducible builds, great security, and sandboxed GUI applications. Seems like a worthy tradeoff to me.

So... Can you replace your workstation OS with Silverblue?
Yes, but immutable desktop OSes becoming a norm will take time. Do not rush.

However, at the very least, you should run Fedora Silverblue in a VM. It will work for Rust developnment, right now.

Thanks for reading!
`/end`
