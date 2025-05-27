---
title: "Working for Governal It Suppliers"
date: 2025-03-21T10:09:30+01:00
draft: false
toc: false
images:
tags:
  - work
  - development
  - government
  - agencies
  - projects
  - agile
---
In my 10+ years of working in the IT industry, I have worked for a number of government IT suppliers.
Wether it be government departments directly or suppliers or agencies for governement IT services.
I had some insight in how these parts of the government operate and why they do things the way they do.

I want to introduce this by saying that I have worked with these departments and agencies but still only had
insight in scoped projects. Which is a good thing on the one hand but means that everything I'm about to write here
needs to be taken with a grain of salt as all of this might not apply to other parts of government projects, agencies, suppliers etc.

Also I need to scope this even further as my experience is limited to the german government and not even the whole of it as every state has its own IT department. Some use the same suppliers and agencies and other use different ones.

So.. with that out of the way, lets get started.

I currently work on a commerce related project for various german governmental agencies. This means that
the current solution of ordering new appliances of any kind as it is currently done will be replaced by the
solution that I and others are currently working on.

This means that we have to create a lot of interfacing components to the older systems to either retrieve old data for migration purposes or forward orders to the processing systems.
All that is not that difficult but as the government is used to very old development methodologies, it is a bit of a challenge.
The teams I work with try to use an agile approach but as far as I can tell no one seems to really know or understand what that means.
A simple example: orders are either send to one system or another depending on what kind of product it contains. But if there are 2 products of different types of products in the same order it should be prevented that this order goes through.
This seems counter-productive and it really is.
I tried to ask for the reason why this is done this way but nobody could give me a real answer.
Mostly the project managers refer to their planning, which contains information that this will be possible in the future but in a later iteration. Making the order process limping before it even starts.
This is one of the decisisons where it shines through that they want to plan the whole project until the end and then implement it, which will innevitably lead to a lot of work afterwards.
The past showed us that there almost always issues come up during implementation as nobody thought about edge cases beforehand.
Dont get me wrong. I can live with a good planning, but then it needs to be done in the right way wit the correct scope.
And the correct scope is most likely the one that does not cripple the product from the start.

I get that there are things that are done because "we always did them that way" but if you plan to do a project that way dont promise your project members an agile approach if it isnt one.

Same with infrastructure. I get that there are processes that need to happen before e.g. a server can be made available t the team. And thats totally fine.
But if you plan to deploy your project on a completely different architecture with a completely different approach I might have a problem with how that is handled.
We are talking about developing on a singlllle server with a lot of ressources but production deployment will be done on a kubernetes cluster with a load balancer and a lot of other stuff.
This is destined to fail during the initial production deployment. There is a reason why we have things like minikube or k3s or even docker swarm. Things that can perfectly fine run a developers machine and are able to represent the final architecture way better than a single server with everything running on it.

These are just 3 examples of how the government IT industry is not agile. And why it takes ages! to get a simple change into the codebase.
To give you a bit more specific context: I wanted to add 6 simple input fields to a form that is used to order a product and I "work" on that particular thing for about 2 weeks now.
This shouldnt even be a 1 day task but the whole process is a mess.
Additionally I get the impression that the project members, in my and other teams, dont really know what they are doing. They seem to have some experience with the technology but more on a junior level than anything else. This is a big problem as we speak about a system that will be used in various states to make sure they can order the things they need to work.
A Co-Worker of mine told me at the beginning of the project that he might need 4-5 people and could be done in about 6 month with the whole project. But the current state is that this project runs for over 2 years now and about 30-40 people are involved.
This is a huge problem but nobody seems to be aware of it. Additionaly, as most of them seem not that experienced, nobody wants to take responsibility for the tasks that need to be done.
This leads me to my current position. Officialy I am just a developer for a specific part on the project, but I do a lot of things now. Release planning, testing, infrastructure planning, documentation, etc.
I only hope that I can inspire anyone on the project to take on some more responsibility, otherwise I dont see the project be done this year.
Oh, did I mention that there is a deadline? Yes.. because of the way agencies need to plan their ressources and finances this particular project has its deadline to the end of this year. If this isnt done by the end of the year it will be postponed to next one or the next or the next one or the next one... you get it.
I like the work, I like most of the people, but I dont like the process and how things are handled.
I will do everything I can to make this project a success.
And even if that means to be a disrupive force.
Trust me. I will work my way through this.
