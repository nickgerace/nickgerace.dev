---
layout: post
title: Findings in Tools Development
minutes: 5
---

Developers writing software for developers: a (kind of) meta concept.
Well, maybe it's not meta, but it's interesting, to say the least.

At it's best, it involves creating and fostering a compelling toolset.
These tools should not only empower and inspire, but should also make your fellow engineers happy.

So how do we create those big ole smiles?

Today, I am going to reflect on tools development during my first four months at NetApp and how my findings may pertain to you.

## Disclaimer

In this post, I may conflate developers with engineers, so I will use "engineers"/"engineering" to describe both.

Encompassing software development within software engineering allows for better readability (read: less writing on my part), and removes an unnecessary layer of abstraction.
Many tools that I have created are in use by test engineers, software engineers, software developers, and all kinds of users.

This also means that I will be loosely defining "developer tools" as a concept.
Specifically, it will include all kinds of engineering-related tools alongside traditionally-defined developer tools (i.e. IDEs).

## Ten Thousand Tools

A tool is sometimes defined as ["something used in performing an operation or necessary in the practice of a vocation or profession"](https://merriam-webster.com/dictionary/tool).
Other times, Tool is a [progressive/alternative/post-rock/metal band](https://en.wikipedia.org/wiki/Tool_(band)).

Precise definitions vary greatly, but I summarize an engineer's tool as an instrument to efficiently create, use, or test software.

*However*, I'm going to add a few minor details...

- Tools are not always *directly* necessary for software teams, but can be *indirectly* necessary by creating happiness.
- Empathy-led research and development takes precedence above all other tooling design patterns.

Happiness?
Empathy?
Why are there soft fuzzy words in my hardcore development machine?!

We are going to forgo the statistics and rely on intuition: happy and well-understood engineers will release better software.

Of course, their tooling needs to accomplish their tasks.
Period.

Yet, practical design does not excuse empathy-devoid development.

How do we know where to draw the line?
Let's do us all a favor, skip the fancy words and look at an example together.

## A Seat At The Table

But... before we do that, I'd like to give some context.

I am a software engineer at NetApp (~4 months into the job) who provides...

- tooling for ONTAP test infrastructure
- automation and libraries for systemic testing
- architecture R&D on our next-generation, cloud-native storage solution
- firefighting whatever Python, Go and Perl fires need to be put out

In nearly all of these scenarios, my code, documentation and research is used by engineers, for engineers.
My peers and I's software paradigms include creating extendable Swiss Army knives versus creating focused SpaceX rockets.

Having said that, high-level design talk and daily workflows are cheap.
Let's get into an example... featuring the extremely talented Solange Knowles.

Solange decides to strengthen the audio engineers' workflows by creating a CLI tool to efficiently organize raw recordings.

Her manager learns of her side project and decides to give her some advice.

"In order to avoid technical debt and user breakages, we should limit the amount of options available.
This way, we can have consistent results and better regression tracking." 

Weighing this as a valid opinion, Solange narrows her scope in argument parsing, but keeps the functional scope the same.
She can use the (newly-freed-up) extra time for extended testing and polish.

Within a week, Solange passes CI/CD checks and submits her awesome (just like her music) code. Success! Right?...

Well, her audio engineers love it for ~40% to ~50% of their workflows, but need to be able to sort by bitrate for audio quality testing.

Shit. Now, the audio engineers may skip using the tool entirely.
This type of under-engineered code can...

- lead to poor adoption due to not replacing or supplementing enough workflows
- miss key user requirements and use cases
- fragment the codebase into several miniature tools (*side note: you can launch many tools from few CLIs, but this can be hard to maintain*)

Conversely, if the tool had too many options, the outcomes may vary greatly and introduce several edge-cases and bugs.
This type of over-engineered code can...

- be difficult to maintain
- require many forms of documentation
- be less performant (*known as "bloat-y"*)

## A Small Price for Salvation

Under-engineering versus over-engineering: the tragedy of the tools developer.

Fortunately, we can use our two minor details, happiness and empathy, in order to provide and maintain better tooling.
These happy-go-lucky-words may imply optional design choices, but they are essential in helping our team release better software.

In my experience, engineering happiness can be generated by the following...

- *Quality of life features* - Display warning messages. Create expansive help/man pages.
- *Local knowledge* - Keep as much information in or around the tool as possible. Minimize external documentation (at least, for general usage).
- *Points of contact* - You can make these available in comments and messages. Provide links to additional documentation.
- *Modular design (optional)* - Some users have very specific tweaks and preferences, so allow for minor changes, modules and functions.
- *Monolithic design (optional)* - Some users want a very simple and fast tool, so provide customizability, but do not perform more than one primary task.

Empathy-led research and development follows a similar path...

- *Attention to UX/UI (even in CLI!)* - Include welcome messages. Consider user input design. Enable output verbosity options when necessary.
- *Language-agnostic error handling* - If writing in English, avoid idioms and leverage industry (universal) termiology.
- *Detailed error handling* - Let the end-user knowing what happened, both technically and in human terms. Create custom messages and use exception and/or error handling.
- *Code readability* - Sometimes, this can come at the cost of performance, but highly interactive (and less performance-focused) tools should strike a balance.
- *Problem solve at the source* - Issues and requirements raised by users are not always root problems, so try to solve the problem at its deepest layer.
- *User-centric iteration* - Provide essential features in version one point bingo, but iterate with user-centric features at the highest priority.
- *Embody environment-specific culture (optional)* - Your design should be familiar to teammates and internal users.
- *Challenge environment-specific culture (optional)* - Your design can poke at the elephant in the room, but gauge this wisely.

## Ole Reliable

Fortunately, my first four months have been awesome at NetApp.
Helping out other engineers and helping ONTAP release operations is a lot of fun.

These design patterns are reflections of the good, the bad, the ugly and the passable.

While it may be easier to create very functional scripts, move fast, and break things, proper software design **leads to** sustainable code.
That includes tools development, not just standard engineering.

The minimal time investment to meet with end users and carefully design the software will save countless hours of debugging, fixing and even re-writing tools.

You wouldn't want your hammer to break in half when hitting a nail, would you?
Sure, the hammer may rust and wear with age, but rarely will the head detach from the handle.

There's a metaphor there... but this blog post has been going for long enough.
Something something... yeah, I've got nothing.
