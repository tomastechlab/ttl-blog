---
title: "An update for the garden shed"
date: 2026-05-20T15:20:00+0200
draft: false
toc: false
images:
tags:
  - ai
  - homelab
  - hardware
  - self-hosting
  - setup
---

I think I have another confession to make. Those three Tesla P100s in my garden shed? I finally replaced them. Not because they stopped working — they were running fine, stubbornly and reliably like all enterprise hardware that has been through worse than what my uninsulated shed can throw at it. But I was done with 16GB per card.

If you've read my [post about running AI in the garden shed](../why-i-run-ai-in-my-garden-shed) you know the setup. Three P100s, 48GB combined VRAM, a Dell Precision Tower 7910 doing its best, and me running Qwen3.6-35B-A3B through llama.cpp. It worked. It really did. But it worked the way a car with a busted muffler works. It gets you there, but you're doing it at about 40 and everyone knows it.

## The VRAM problem

16GB per card sounds like a lot until you start loading quantized models that want to stretch across all three cards and you realize that the inter-card communication eats more performance than the inference itself. I was running Q6 quantization and it was fine, but Q8? Forget about it. The model would spill into system RAM and the response times went from "annoyingly slow" to "I might as well wait for ChatGPT to finish its daily motivational quote."

But the real issue wasn't the P100s. It was llama.cpp.

## llama.cpp is not the enemy, but it's not the hero either

Look, I love llama.cpp. It's been my go-to for months. The thing that runs on basically anything with a GPU and a pulse. But as my models got bigger and my expectations got higher, I kept hitting walls. The token generation was fine for small models. But with the urge to switch to a 27B dense model split across three cards? I was getting maybe 5-8 tokens per second on good days. And context windows beyond 32k tokens? The performance just collapsed.

That's when I started looking at vLLM. (and specifically at the club3090 setups <- more on that in another post ;) )

## Enter vLLM

vLLM has been making waves in the self-hosted AI community for a while and honestly... i couldnt get it to work with my P100s. But vLLms techniques makes it dramatically better at managing KV cache memory than llama.cpp (this was before the MTP patches were applied upstream). In practical terms, that means I could load the model i wanted, run a pretty huge context length, and get more like 15-20 tokens per second instead of 5-8. Not bad for swapping out one binary for another.

But there was a catch. vLLM did not want to run on my P100s. The support was simply not there. There were forks which pressumably were able to use the cards but... lets be honest. This would have been a bandaid solution and I want to have something solid. This is where the P100s really showed their age — even with 48GB total, vLLM was not able to load but llama.cpp would work with okayish speed.

So I decided to bite the bullet and upgrade.

## The hardware swap

Two RTX 3090s. 24GB each. 48GB total — same number as the P100s but a very different beast. These are consumer cards. They have Tensor cores. They have actual memory bandwidth that doesn't make me want to cry when I look at it. The P100s were great for their time but they're Compute Capability 6.0. The 3090s are Compute Capability 8.6. That's a full generation of CUDA improvements sitting between them. 

The 3090s arent really cheap currently, even on the used market, but if you look around and search a bit you might find a good deal. I picked up a pair for a price that honestly makes me feel a little guilty. Enterprise hardware is cheap. Consumer hardware that nobody wants anymore is even cheaper (usually).

But 3090 cards arent necessarily known for their good power management. In fact, its quite the opposite. The first time i wanted to load a model via vLLM mys system crashed and hard rebooted. 
The power draw of the cards was just way too high. 
The solution? I underclocked them to 1000/1400 MHz with a 250W power limit per card (and even testing them with 175W currently). The shed is not exactly climate-controlled and I'd rather have a card that runs cool and steady than one that thermal throttles every time the sun hits the roof at noon or even trip my breaker every time I try to load a model or trigger some inference tasks.
But I can hear you scream already "Its so far underclocked and power limited! This is not usable at all!" and you know what? You are pretty much wrong. I run Qwen3.6 distributed over both cards and the answers i get from that model are basically instant. I dont have the numbers yet but trust me if I say: This is usable for day to day work!

## What I gained

- I can load full precision variant models without my patience running out.
- Longer context windows without the performance cliff. 128k or even 132k context is now something I can actually use instead of just dream about.
- Faster response times across the board. Not just for big models, but even the smaller ones run snappier through vLLM.
- One less thing to manage. Two cards instead of three. No 3D printed fan shrouds anymore to maintain.

## What I lost

- The romance of running a rig built entirely from enterprise surplus. The P100s were these unloved, unsexy workhorses and there was something satisfying about making them sing. The 3090s are just... GPUs. Consumer GPUs.
- A little bit of VRAM headroom for multi-GPU splitting. Three cards gave me more flexibility for running multiple models or larger batch sizes. Though in practice I was never actually doing that, so it's a loss of theoretical capacity, not real-world utility.

## Does any of this make sense?

Probably not. I have two consumer GPUs running in a garden shed, underclocked (and probably overcocked from no insulation), running open-source models that cost me nothing except electricity from solar panels, and I'm excited about it. There's definitely something a bit obsessive about the whole thing.

But it works. It's fast. It's mine. And when I sit down to write or code or just talk to my AI assistant, the response comes back quickly enough that I don't have time to second-guess whether I should have just used ChatGPT instead.

Plus there's the satisfaction of knowing that the thing answering my questions is running on hardware I bought on the used market, cooling itself in a shed behind my house, and nobody at OpenAI or Anthropic knows it exists.

That feeling is worth the hours I spent fiddling with CUDA versions, nvidia-smi commands, and Docker configs.

It might not make sense in any shape or form for you. But I swear it's a lot of fun for me.

