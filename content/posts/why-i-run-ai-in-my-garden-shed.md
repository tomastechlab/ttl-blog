---
title: "Why I Run AI in My Garden Shed"
date: 2026-04-21T17:21:33+0200
draft: false
toc: false
tags:
  - ai
  - homelab
  - hardware
  - self-hosting
---

Let me start with a confession: I have three NVIDIA Tesla P100 GPUs sitting in an old Dell workstation in my garden shed.

Yes, a garden shed. Not a datacenter. Not a climate-controlled server room with redundant power supplies and backup generators. A garden shed. With possibly the most uninsulated walls you can imagine.

And you know what? It works. Surprisingly well.

The question I get asked most often (or should get asked, people just assume I'm using ChatGPT like everyone else) is why I bother with all this when OpenAI, Anthropic, and the other big players exist. Their models are better. They're faster. They cost pennies per API call when you look at it on the surface.

So why?

## The short answer: Because I can.

The longer answer: Because there are reasons that go way beyond just "I want to tinker."

## Privacy that actually means something

Every time you send a prompt to an AI API, that prompt lives on someone else's server. It gets logged, cached, potentially used for training. You can read their privacy policy until your eyes bleed, but at the end of the day, your data is not yours anymore.

My data stays in my garden shed. Period. No cloud. No API calls to third parties. Nothing leaves my network unless I explicitly tell it to. For someone who runs a home automation system, a surveillance setup, and basically tries to make everything as self-contained as possible (more on that in [Hosted in the Woods](../hosted-in-the-woods)), this was a no-brainer.

## It's already paid for

Those three Tesla P100s? They're enterprise hardware that lost half its value the moment someone in a datacenter upgraded to something shinier. You can grab them for peanuts on the used market. The Dell workstation they're in? Also old enterprise gear that costs next to nothing.

Compare that to the monthly cost of AI API calls. Sure, for casual use it's cheap. But I use AI daily. Multiple times a day. For work, for personal projects, for writing blog posts, for everything. The costs add up. My hardware cost me almost nothing and has zero ongoing costs beyond electricity, which is covered by the same solar setup that powers the rest of the homelab.

## The performance is actually fine

Now, let me be honest: Qwen3.6-35B-A3B is currently one of the most powerful open source models out there. But OpenAI's or Anthropics offerings are better. They're smarter. They're faster.

But here's the thing: its fast enough for what I need. And they're fast in a way that matters to me. There's no rate limiting. No "you've hit your usage cap." No queue. No waiting for an API response while someone else's request gets prioritized.

The response time is consistent. It's mine. When I need it, it's there. No throttling, no surprises. 
And as I am basically the only user of it, I can add some nice personality and memory capabilities to it that
bother nobody but me.

## The shed situation

Okay, so a garden shed is not an ideal environment for GPU hardware. Temperature fluctuations. Dust. The usual. But it's been running there for months without issues. The Tesla P100s are designed for datacenter environments anyway, so they're actually more robust than you'd think for something sitting in a shed.

The Dell workstation handles the heat just fine with some additional cooling via 3D printed shrouds for the cards. And if it ever gets too hot, well... that's what sensors and automation are for. [My homelab](../hosted-in-the-woods) has plenty of tools to monitor temperature and take action if needed.

## The real reason

At the end of the day, the real reason I run my own AI is the same reason I run my own server, my own NAS, my own home automation, my own DNS, and basically every other service I can host myself.

It's not about saving money (though that's a nice bonus). It's not about privacy (though that's important too). It's about control and ultimately fun!

When you use a cloud AI, you're at the mercy of their pricing changes, their availability, their terms of service, their decisions about what you're allowed to ask. Your assistant belongs to them. And lets be honest... none of them has 99.9% uptime.

When you run it yourself, it's yours. Always. No one can turn it off (except you if you want). No one can change the rules. No one can decide YOUR use case is "too controversial" or "outside acceptable use."

And honestly? That feeling of running something that is completely, unapologetically yours is worth a lot more than the few cents saved per API call.

## The hardware setup

For those curious about the actual setup:

- **Workstation:** Old Dell enterprise workstation, Dell Precision Tower 7910, its a tank
- **GPUs:** 3x NVIDIA Tesla P100, 16GB VRAM each
- **Model:** Qwen3.6-35B-A3B (Unsloth Q6 variant, though I could run Q8 with smaller context, but that 131k tastes way too good)
- **Location:** Garden shed, connected to my home network and a dedicated backup internet line (just in case)
- **Cooling:** Workstation fans doing the heavy lifting, I added some 3D printed shrouds with additional fans as the GPUs have no fans themselves

Three P100s give me 48GB of combined VRAM, which is more than enough for the model I'm running. The setup handles everything I throw at it without breaking a sweat. And with such old Hardware I have plenty of headroom to 
get bigger/better/faster cards to upgrade to (currently a pair of RTX 3090 look very interesting)

## Final thoughts

Do I recommend this to everyone? No. If you just want to ask a question occasionally, use an API/the free tier. It's easier, it's cheaper for light use, and it works.

But if you're someone who uses AI daily, values privacy, and has a tinkering itch that needs scratching... building your own AI setup might be the most fun you'll have with hardware all year.

Plus, there's something deeply satisfying about telling someone that your AI assistant runs from a garden shed with three retired datacenter GPUs and a solar-powered connection.

It might not make sense in any shape or form. But it's a lot of fun.
