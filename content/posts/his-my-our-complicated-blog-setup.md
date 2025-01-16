---
title: "His/My/Our complicated blog setup"
date: 2024-11-28T10:07:25+01:00
draft: false
toc: false
images:
tags:
  - hosting
  - homelab
  - projects
  - blog
---
If you've read some of my earlier posts about how I host this blog you might be wondering how the software stack looks like.
Or you dont. I dont know. But I will tell you anyway and reference a youtube video I came across which somewhat resembles 
the way I do it. 

For starters, this is the software I use:
- hugo 
- editor of my choice (currently vscode)
- bash (scp)

and thats basically it.
This is the general workflow I use:
- create a new post via `hugo new post posts/my-cool-new-entry.md` on the CLI
- write the new post (fill with content, adjust tags and headline... and so on)
- execute my deploy script

The most magical thing in here might be my deploy script. Which is essentially just a scp command which syncs my local folder to my webhost. No, not [THAT SCP](https://scp-wiki.wikidot.com/) I'm talking about [THIS SCP](https://manpages.org/scp)
And thats it. This is how I publish my blogposts. 
There is one additional step that I havent mentioned yet but its not vital to create a new post.
I also use git as kind of a "backup" solution in case I lose my machine or access to it or everthing goes up in flames... you never know.
Besides that I also use regular backups (of course! and you should too!) but its a nice convinient solution to be able to just clone my blog and work on it anywhere if needed. 

What triggered me to create this post was a [youtube video by NetworkChuck](https://www.youtube.com/watch?v=dnE7c0ELEH8) where he explains on how and why he has started a blog and explains how he has set it up so you can follow along and do the same. 
His solution is way more engineered than mine as he wants to use [Obsidian](https://obsidian.md/) as his post editor of choice (and thats totally fine if you ask me). 
So if you want to blog yourself and automate the publishing process you now have at least two options on how to do it. But you can always use other software and tools to publish your content. 
What matters in the end is that if you want to publish something, you can. And it should not be to difficult for you and fit your flow. 
For me this solution works, for you it might be something else.