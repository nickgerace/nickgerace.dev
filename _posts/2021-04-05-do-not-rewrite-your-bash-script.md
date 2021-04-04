---
layout: post
title: Do Not Rewrite Your Bash Script In Another Programming Language
---

Alright.
We're starting off with a fiery blog post title.
Let's do this.

One of my biggest pieces of technical advice to new software engineers is to not write something in another language that could be written in Bash.

> By "Bash", I mean [Bash](https://www.gnu.org/software/bash/), [Zsh](https://www.zsh.org/), [PowerShell](https://docs.microsoft.com/en-us/powershell/), [Fish](https://fishshell.com/), [Nushell](https://www.nushell.sh/),  etc.
> Saying "shell" might not immediately register with some folks, and might even be an incorrect generalization since, colloquially, "shell" widely differs in definition.

There are two exceptions to this piece of advice:

1. **Multi-platform support:** even if you require external command execution, choosing one programming language can still be preferred for multi-platform usage and maintenance.
2. **No external commands:** even if your program is written in a Bash-script-like format, having advanced error handling, great runtime performance, and no `PATH` dependencies can advantageous.

My most popular GitHub repository, [gfold](https://github.com/nickgerace/gfold), was intended to be a small application to help me learn Rust.
It does many of the same things that the `git` CLI can do, but I still attempted to ensure that it satisfied the above two exceptions.

> Fun fact: `gfold` started in a private repository in the second half of 2019.
> It was never intended to be maintained, but here we are!

With that being said, I'm writing this post because I *still* run into the Bash-rewrite trap.

Let's go back in time a bit.
I was *(read: probably still am)* a huge Linux fanboy in high school and college.
Surfing my favorite subreddits, I was enamored with the beautiful terminals, desktop environments, and TUIs that people created and curated on Linux.

I wanted to help these communities in some fashion, but I did not have any unique, helpful ideas for new software at the time.
Thus, I defaulted to wrapping my favorite CLI applications from Reddit with Python and Go code.
Most of these programs were related to networking and system monitoring, and my programs did not fundamentally bring "new tech" to the user.

> I'm telling you this to save yourself: do not be me, unless you are doing it for fun, or for programming exercise.
> Documentation changes, unique blog posts, community involvement, etc. are much more important than writing the type of software that I did.
> Arguably, even writing nonsensical software that does not execute external commands would still have been more useful (though, that's arguable).
> Yet... I had fun writing some "useless" software.
> Programming is fun!

After an internship, higher-level undergraduate courses, and some industry experience, I began to write software that I believed was fundamentally "my own".
I'm not claiming that my early projects provided useful code to the world, but I believe that they were a step in the right direction.

**Fast forward to this past weekend:** I was writing a new Rust CLI application for personal use when working with [Kubernetes](https://kubernetes.io/) clusters, and realized that I needed the [Helm](https://helm.sh/) API.

> Before we continue, I understand that this would have been easier to write in Go (though I adore [kube-rs](https://github.com/clux/kube-rs)).
> My personal projects do not always make sense and often exist as programming exercises.

I *could* generate a `helm` crate with its `proto` files, similar to [the crate already available](https://crates.io/crates/helm-api), but this felt a little extreme for such a small CLI program.
Thus, I wrote a concise `helm` external command library that handled various failure scenarios and wrapped the subcommands I needed.

The allure of downloading files with asynchronous code and programmatically handling edge cases was immense, but it was so immense that I did not realize that I was misusing my time.
It was only after that I had the program working that the realization kicked in.
If had not be using any external commands, then it may have never kicked in.
Regardless, the following questions began to flow in:

- What was this CLI application solving that my Bash scripts with `set -ex` couldn't already do?
- Would my `kube-rs` + [reqwest](https://github.com/seanmonstar/reqwest) implementation truly surpass what `kubectl create -f` could do when I was going to be using other external commands anyway?
- Even if I did not need to execute any external commands, was this software fundamentally worth writing?
- Were the speed and reliability increases substantial enough to warrant writing a new program?

The answers to these questions were what you might expect:

- No, but it did some things a *little* bit better.
- Yes, but not in a substantial manner since I was already going to be calling `helm` externally.
- Potentially, but that is a hypothetical question.
- If there were no external commands, then maybe?

I decided that writing a Bash script was a better use of my time.
However, I *still* had some internal conflict over the matter.
As I said earlier, "I *still* run into the Bash-rewrite trap".

This trap is so pervasive because it can be easily forgetten when paired with a strong desire to write performant, useful, and reliable software that has multi-platform support (when possible).
Bash scripts can be prone to human error and sometimes do not provide *any* of the aforementioned benefits.
However, re-writing anything without provable, substantial advantages over the original implementation is usually a bad idea.

Thus, I have stuck to the following mantra: do not write software that could be written in Bash unless you need multi-platform support, or you are not executing any external commands.
Obviously, the real world is messy and there's much more nuance to deciding the right tool for the job, but this mantra has generally helped me make better use of my time.

Well... it has "generally" helped me.
We are here, writing this post, aren't we?
