---
title: "Hosted in the Woods"
date: 2024-10-28T19:55:29+01:00
tags: ["hosting","homelab","projects"]
draft: false
---
Guess what happened.. I got rid of my expensive server in the datacenter. Ther very server that is hosting this site.
But how? You might ask. Good question! I would like to explain everything in detail but... lets be honest, I would mess up
and dox myself on the internet. 
But I can give you the gist of it. 
What basically happened is that I created my own homelab. Which means I'm essentially my own hosting provider now. 
Which means in return I can run this site and essentially all my services (more on them later) on a very small box with very little power requirements which is, in the end, waaaayyy cheaper than renting a vps at one of the big hosting providers. 
Sure, I miss out on a lot of nice features they offer, like redundant connections, firewalling, storage, cooling solutions...
but do I really need all of this? 
Let me tell you.. I have way more failsafe solutions than needed for this small site and all my other services (more on them later)
So whats the deal then? I have a small computer running in the woods, its needs next to nothing in terms of power, has a redundant 2kw/h battery backup (which is absolutely overkill for this), main power is coming from an array of solar panels so power is no concern. 
What about connectivity. I have a dedicated internet conenction for this machine and on another connection to my home network. This means I can expose anything I want to the internet from this machine and dont have to worry of exposing my home or work machines through it in any way as all services are bound to an interface. 
And lets be honest, the person that will have the most issues with this blog being down is myself. And even if the internet connection goes down I can still access my blog via a local connection. So I can create my entries even without internet. 
If this makes sense in any shape or form is a topic for some other day.

But what about my services that I keep mentioning?
I run a bunch of stuff which is currently only running in my local network. Which means I can only access it if I'm home. 
But thats no issue.... yet. If I would ever need to connect from a remote place into my system I would set up a vpn connection 
into my home network... which I may or may not have already done ;)
But what am I running here? 
- a NAS which holds my borg backup repository
- a gitlab instance for my small project that I dont want to share with the world (like my home AI assistant)
- my home AI assistant
- octoprint to schedule print jobs on my 3d printer
- music collection which grows day by day and has the ability to run without a spotify/deezer/whatever subscription
- a plex server for inhouse movie streaming (because optical media is BAAAADDDD)
- piHole to get rid of annoying ads when I'm home
- dns server to reach all these services via a nice home.lab domain
- homeassistant for all my home automation tasks
- photoprism for photo backups from my and my wifes phone
- paperless for document management (because haptic paper BAAAADDDD)
  
...and I bet I forgot at least 3 to 5 other systems that I cant remember at the moment. 
So you see there is quite a lot running in my homelab. But most of it isnt not relevant or even practical for external use.
Therefore I currently only expose a firewalled docker container with a webserver to the web. The one that is hosting this very site you are reading.

So I hope I could give you, dear reader, a litte overview of why I dont need a big server hosted in a giant facility with lots of failsafes.

It might not be much in the end, but its ~~honest work~~ a lot of fun!