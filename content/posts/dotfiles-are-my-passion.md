---
title: "Dotfiles are my passion"
date: 2025-12-18T10:13:34+01:00
draft: false
toc: false
images:
tags:
  - work
  - setup
  - projects
  - development
---
Have you ever heard about dofitles? Do you know what that is? If not, let me give you a quick introduction.
Dotfiles are basically your personal configuration of your own system. At least if you use a linux system. Or MacOs.
But i dont think there is an equivalent on Windows (i actually dont know). 
But on a Unix based system you have most of your personal configuration somewhere in your home folder. 
Most of the time its in .config other times it might be in .local or even in .ssh. The fact alone that 
these configurations can be scattered around your home folder is enough reason to manage these files.
Either across mutliple machines, so you can have the same experience wherever you are, or just to have 
backups if you decide to nuke your system and start fresh but still have a baseline of configs to work with.

For this purpose exist multiple solutions already. Things like [yadm](https://yadm.io), [chezmoi](https://www.chezmoi.io/) or more simple like [stow](https://www.gnu.org/software/stow/). These are all great solutions and they work probably very good 
if you get used to them. But I didnt. I tried a lot of dotfile managers and none worked like i wanted them to work. Or if they worked like I imagined I couldnt get consistent with them because they were too much out of my way and I dont use them 
often enough to get comfortable. 

I like the idea of having a central place where the original files are stored, this place is versioned and the files are 
just symlinked to the place where they are needed. 
Stow can achieve this with very little effort and I tried it. But I couldnt for the life of me remember its syntax.
Sure, I could just look up the man page or the cli help. But something wirh it did not sit right with me.
Same story is with a lot of the other tools. Either they did too much or they did too little or I just 
couldnt get comfortable with them.

Then I did what every sane and reasonable person would do. 
I did it myself and called it [reDot](https://github.com/tomastechlab/redot). Its a script that I created. Its pretty minimal but powerful. In the end
its similar to stow but it feels even easier for me. There is a single folder with all my config files. No need to remodel my
folder structure and I could even have multiple versions of the same file in that folder. 
And I think the reason why it feels so easy for me to use is that I can tell it to version a file for me and it 
will grab the file, move it over to the storage folder, symlink it back to the original location and I have to do nothing else with it. 
It works for me. Oh! And it has git sync included. So everything can be backed up and restored easily. 
Including the utility itself. So my config and the tool to keep it up to date is just one git clone away.
I think this script works for me because I wrote it myself. Purposebuild for me. And therefore I understand what it does
and how to use it. 

e.g. I know I shouldnt push any files with passwords in them because there is no encryption for sensitive files (yet!) but 
I am aware of that and dont do such things.

If you like to try it, its currently on [my github](https://github.com/tomastechlab/redot). Check it out, create an issue or hack on it yourself. Its MIT licensed so you can do whatever you want (as long as its inside the boundaries of the license)
