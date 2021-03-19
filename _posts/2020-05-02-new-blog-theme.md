---
layout: post
title: New Blog Theme
minutes: 2
---

**March 2021 Update:** Now it's back to `minima`, lol.

*(original post begins below)*

This blog has a new look!
The default [minima](https://github.com/jekyll/minima) Jekyll theme had served me well, but it was time for a new one.

After a few days of trying different static site generators and themes, I decided to stay with [Jekyll](https://jekyllrb.com/) and go with the [Type](https://rohanchandra.github.io/type-theme/) theme.
Why did I choose to go with these two?

## Generating The Definition

I'll try to keep this blog post brief (at least, much more than usual).
There were three static site generators that caught my eye, and I ended up going with Jekyll.

Before we continue, let's define what these pieces of software are first.

A static site generator takes Markdown files and uses HTML templating software to create a static website.
This may be a bit reductive, but I like to think of Markdown as the YAML of web development.

Why not create a dynamic website?
A dynamic website would require a Javascript runtime, which makes deployment much more difficult.
Static websites also consume less energy, bandwidth, are easier to load, and are all you *probably* need for a personal blog.

## Dynamic Contenders

While I was impressed with [Hugo](https://gohugo.io/) and [Zola](https://www.getzola.org/), I wanted to avoid as much hassle as possible in deployment.
I had successful builds and tried many beautiful themes with the other two generators, but having as little friction as possible when deploying my site was my most important requirement.

This site is hosted on GitHub Pages, which supports Jekyll by default.
There's no need to maintain a *gh-pages* branch or any kind of build workflow.
Despite Jekyll's major advantage there, two big things stuck out to me when using Hugo and Zola.

- Using GitHub Actions made deployment much easier than the last time I tried a different site generator.
- Since my two favorite languages are Go and Rust, understanding how the generators worked was much easier.

If I explore self-hosting, change my host provider, or GitHub Pages adopts a new default generator, then I may try Hugo and Zola again.
For now, I'm sticking with Jekyll.

## Theme Battle

There really wasn't a theme battle.
I pretty much saw the Type theme in a sea of Jekyll themes and loved it immediately.

For my website, I pretty much need...

1. The blog posts themselves.
2. Access to social meda links.
3. Ability to create and link informational pages, like "about".
4. A great light theme. (Yes, I'm serious. Light theme everything).

Type delievered on all those fronts, really well.

## Just Type

I'm thankful for [rohanchandra](https://github.com/rohanchandra/type-theme) and all of the other contributors that make things like Jekyll and Type possible.
Blogging is easy, fun, and efficient when creating a site with GitHub Pages and a static site generator.
I highly recommend trying it out!

Huh.
I guess this was actually a short post, for once.
