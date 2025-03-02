---
title: "Updates to the Homelab"
date: 2025-01-17T10:16:00+01:00
draft: false
toc: false
images:
tags:
  - homelab
  - hardware
  - server
---

I just recently decided to upgrade my homelab once again. Especially my trusy little "Service"-Machine. You remember? The one I wrote about in my [Hosted in the woods](../hosted-in-the-woods) entry.
It will be basically the same system but I want to upgrade the hardware. 
Currently it is running on a small i3-6100T machine with about 16gigs of RAM and a SSHD Harddrive. 
Why is it so low spec'd you might ask. Good question!
First of all: for what I am doing with this machine I dont really need much computing power or massive amounts of RAM.

BUT!

I have come to the point where I just need a tad more performance. 
So far I was the only one using this machines capabilities. Which means: Now there is someone else, right?
Yes... and no. Let me explain:
The reason I need some more ressources on this machine is simple: more is always better. 
Just kidding!

I ran out of storage on the system itself (the NAS still has plenty room, but its used for other things) 
and I wanted to upgrade the systems SSHD to a proper SSD anyway at some point and as I have it offline and open, I might as well just upgrade everything else.

I will upgrade the main components of the systems going from
i3-6100T to a i7-6600T (i am stuck at 6th gen with the current board and dont want/need to change this now)
16GB to 32GB DDR4 RAM
and
500GB SSHD to a 2TB SSD
I think this will give me enough ressources to manage my services without bottlenecks and also allow multiple users on the system.
Because in the future I would like to use this machine as some sort of proxy/gateway to other machines. It will cache the most recently requested data locally and be my single point of ~~failure~~ entry to my homelab.
I will write about my (hopefully boring) adventure of cloning my current system to the new harddrive but first I have to do it.
All parts are in the mail and I am waiting to receive everything in a few days. 

Lets hope this will work *fingers crossed*  

UPDATE:
I received all parts for my homelab upgrade. And if you can read this it means that everything is at least running again. 
I wasnt able to update all the components like I wanted to but the CPU and Harddrive are working. 
For some reason the machine refuses to boot with the new RAM. I checked the manual and the vendor page for compatibility but couldnt find anyth9ing that would speak against this amount of RAM. 
I have one more idea as to why its not working and that might be the BIOS version. I never updated the BIOS on that machine and maybe a newer version extends the comaptibility of possible RAM sticks. 
The issue is that this is a headless system. Meaning I dont have a screen or peripherals attached to it. There is just the ethernet connection, a usb connection to a NAS and the power line. 
But I recently heard something about a jetkvm oder nanokvm or something which is apparently a low cost kvm solution that provides I/O over ethernet. 
I will have to take a closer look at possible solutions because from what I saw the current solutions are using HDMI for screen output and my machine only has DP.   