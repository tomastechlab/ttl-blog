---
title: "3D Printing with 10mm accuracy"
date: 2024-12-23T07:38:37+01:00
draft: false
toc: false
images:
tags:
  - 3dprinting
  - homelab
  - projects
---
I know, the title is strange. 3D Printing with 10mm accuracy doesn't really sound that nice does it?
And in reality, its really not. But this is what is currently happening on my Ender 3v2.
I just recently converted it to a direct-drive and upgraded the firmware to the latest version.
So far so good. The upgrades went smooth and my first testprint was due.
But then it happened. I got the infamous M112 Error.
For anybody unintiated, M112 is basically the equivalent of a fatal error.
It stops everything immediately to prevent any damage from happening.

Luckily for me, it was just a loose cable on my BLTouch.
But after fixing that I saw another issue.
Even after leveling the bed, manually or automatically, the Nozzle would stay about 10mm above the bed and just squirts out filament.

This is the current state of the printer.
I can send print jobs, it will level the bed if given the G28 code, I can save the and load the Mesh and datawise it looks fine to me.
But the nozzle refuses to go lower during prints.
I'm pretty sure that there is an z-offset somewhere that I need to adjust. Maybe directly in the firmware?
I'm not sure but this sounds like a fun litte afternoon project to solve.
Hopefully I can fix this today because I dont want this issue in my head during the holidays.

We will see, I keep you posted.

UPDATE(!): I fixed the z-Axis issue. There was indeed a weird z-offset in my firmware. I probably added it myself as I compiled it originally.
Well, one fix and compile later, I could flash my printer and set the needed z-offset on the printer itself.
But then I decided to change my hotend and now I have to readjust anything again anyway ¯\_(ツ)_/¯
