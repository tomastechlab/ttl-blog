---
title: "Marvin: Under the Hood"
date: 2026-09-24T15:43:24+0200
draft: false
toc: false
images:
tags:
  - ai
  - homelab
  - hardware
  - self-hosting
---

Last time I wrote [about a new coworker](../a-new-coworker), and I made a promise. I said I would explain the setup in more detail: the overall design, the caveats, how everything ties together. And I even warned you: *this is more jank than it currently sounds, so be prepared.*

Are you prepared? Good.

First the honest part: not everything I told you is 100% true. Or not anymore. Marvin does not yet see my screen all the time (anymore), and the webcam for "who's in the shed" is currently in a massive refactore than a running system, but its working...sometimes.. when I test single features of it. But the core of him like the voice, the brain, the memory, the "hands" that can actually *do* things - that part is real, and this post is about it. The camera stuff is coming when I give him a body (more on that another time. You will hear about it when my 3D printer finishes its 10mm-accuracy era and I start printing a head, damn I am excited about that!).

## The big picture

The whole system lives basically on two sides of the network. This is at least the idea, so here is the picture:

```
  "The Device" (a ESP32-S3/Homeassistant voice preview in my office)
  mic -> "Hey Marvin" -> record -> send -> speak
  (it is dumb on purpose, and lightweight on purpose)
        |
        |  WiFi (the magical rainbow road)
        v
  The Server (in my garden shed)
  STT (Whisper) -> LLM (LLM Model, with a bunch of tools) -> TTS (currently CosyVoice3 incl a voice clone)
  plus: memory database, personal rag, wikipedia, websearch, timers, events queue...
```

The design principle is: **the device is more of a thin client. All the intelligence lives on the server.** The firmware never gets smarter, besides better wakeword models. New features are just tool handlers on the server, and the device just... gets to talk about them. That decision came from my previous dozen or so attempts at this. Every one of them ended as one big monolith where a TTS change meant debugging 4000 lines of everything-else. So this time: small services, one thing each (keep it unix baby!), and a lightweight pipeline that just passes audio, text and events between them.

## The device

For the physical part I did something I tried to actually not do: I bought hardware. A **Home Assistant Voice Preview** device. Yes it is more on the older side, yes it is not in the fashion of DIY but its convenient and actually nothing i could not just replace with a raspberry pi,speakers and a microphone. Inside it its a ESP32-S3 with a XMOS voice kit microphone (16kHz, proper I2S, not that flimsy MEMS stuff), an audio codec, a speaker, and a ring of 12 WS2812 LEDs (those can do fancy things!). I then replaced/extended the firmware with my own custom components that build on built on ESPHome. That repo lives on my machine (and maybe soon on GitHub or somewhere on the net, where everything else of mine eventually ends up).

Why bother with a device instead of just a mic on a laptop? Because a coworker should have a *presence*. The device can be muted with a physical switch (hardware mute, GPIO, cannot be overridden by software - I like that a lot. More people need a SHUT UP switch). It has a rotary dial for volume, a center button that stops everything when you click it (translates to a digital punch in the face if needed) and the LED ring tells you what Marvin is doing at all times as a nice visual indicator:

- **fast blue spin** - he is recording you
- **purple pulse** - he is thinking
- **green spin** - he is talking
- **red pulse** - something is wrong
- **half the ring lit** - a timer is running, the ring shows how much time is left

There is also a Morse-code pattern that plays an easter egg and a rainbow. I will not tell you more (yet).

## The wake word: I trained my own

The device does not use "Okay Google" or any cloud wake word like Alexa, Siri or whatever they are called nowadays. It listens for **"Hey Marvin"** A wake word I trained myself. The Home Assistant voice ecosystem ships a nice tool for training tiny micro wake word models (it runs on-device as a 40k-parameter TFLite model, which is small enough for an ESP32-S3), and in my training folder you can find the pieces needed for that: I generated the training audio (i sat down and spoke into a microphone) and also used Marvins own TTS System to generate audio in German and English, extracted features, and let the tool do the rest. The JSON metadata even says `"author": "Tomas"`. Slightly pretentious. I know.

It has 5 sensitivity levels you can tune from the devices web-interface (did I mention that it has a webinterface?), and a second wake word, **"stop"**, that is only active while Marvin is talking. So yes, I can interrupt him and he will start listening to me. That was a very important feature for me. A coworker who monologues is just a podcast you cannot pause.

The device does simple voice activity detection (a rolling noise history, a threshold, 3 seconds of silence ends the sentence) and then POSTs the OGG to the server. One detail I really really like: after Marvin finished speaking, the mic listens for up to 3 seconds for a follow-up question. No second "Hey Marvin" needed for questions like "What about tomorrow?"

## The server: the actual brain

All of this runs on a box in the garden shed (you know the one, from [Why I Run AI in My Garden Shed](../why-i-run-ai-in-my-garden-shed)). The pipeline is a FastAPI app that takes the OGG and runs it through four steps:

1. **STT** - Whisper, running as its own service on `:8763` converts speech to text
2. **LLM** - currently a local 27b model (Qwen 3.8), served via vllm on an OpenAI-compatible Endpoint on `:8010`, uses two of the GPUs in the shed
3. **TTS** - CosyVoice3 on `:8770` converts the LLM answer to voice using a voice clone of one of my favorite gaming characters (the unnamed hero from the Gothic series)
4. **Back to the device** - gets an OGG, played through the speaker

That is basically the whole loop. No cloud in it, no external services. The only things that ever leave the shed are: web search queries (via Firecrawl or Tavily as fallback), weather requests (to Open-Meteo) and Wikipedia lookups if my local version of it is not sufficient. Also there is a memory system which holds all the personal information gathered during conversations. 
But if the shed loses power, Marvin goes silent. That is the point.

### The jank

I promised caveats. Here they are:

The pipeline is currently just **one single Python file**, `app.py`, around 3000 lines. I know, I know - but the "one script does one thing" philosophy applies to the *services* (STT, LLM, TTS they are separate and swappable, which is how I got to try Qwen3-TTS and Omnivoice and now CosyVoice3 without touching the rest). But the orchestrator itself is the monolith I swore I would avoid. And I will change it.. maybe.. hopefully. It works for now, and the backups in the folder (`app.py.bak-playback-fix`, `app.py.bak-tts-downsample`, ...) prove I iterate on it more than I would like to admit.

But it runs as systemd service that tries to recover if it ever fails/crashes whatever. If it dies, I notice and I have logs about it! That is actually moreuseful than I tought initially. A feature in disguise you coud say: I can see when my coworker is down, instead of wondering why he suddenly became unresponsive.

And the LLM is local, which means: great at most things, occasionally weird, and limited in context. The 27b model does 95% of the work. The other 5% I am fixing by being the one who has to live with the consequences. Or teaching it to somehow avoid the quirks. (Did I hear custom fine-tune??)

## The persona (the part that went surprisingly well)

Marvin's soul is a system prompt. Its just text. It is defined in German - he answers in German - with a few simple rules: short and natural, no emojis, no markdown (he "knows" his words are *spoken*, not read) and one very special thing:

The TTS engine (CosyVoice3) understands **paralinguistic tags** inside the text. So the LLM is allowed to write things like:

> Das ist [laughter] wirklich der beste Witz des Tages!
> Puh, [sigh] dann nehmen wir es einfach in Ruhe hin und schweigen uns gemeinsam dazu aus.
> Das ist <emph>wirklich</emph> eine gute Idee.

Marvin can therefore literally *laugh*, *sigh*, *cough* and *gasp*, directly in his sentences, because the model writes the sounds into the text and the TTS converts them into spoken words. The prompt is pretty strict about it: max 1-2 tags per sentence, only when the context carries it, never on neutral confirmations (a timer confirmation is not a moment for [gasp] duh!).

I wrote the rules initially expecting the model to overdo it. But it does not. Sometimes a sigh lands exactly where a sigh belongs, and that is a moment I keep meaning to write about and then just... sigh.

## The tools: Work he can actually do for me

The LLM currently can call **16 tools** (function calling, up to 6 times per answer). Some of them:

- **Timers** - "Marvin, 5 minutes for the eggs" → the timer runs, rings over the device speakers when it expires, and the LED ring ticks down the last hour/minute/seconds 
- **Appointments** - one-shot reminders, max a year ahead (arbitrary limitation for testing purposes), self-deleting after firing
- **Lists** - a shopping list ("Einkauf") and notes ("notizen") per session. "Add milk to the shopping list" works. So does "remove item 3" or "Put buying a present for aunty on a list"
- **Weather** - my default location is my home (yes, I basically live in the woods, as you may have read). Any other city works via geocoding. "How is the weather this weekend?" gets a two-sentence summary, but I can also ask "How is the weather in Japan tomorrow?" 
- **Fact check** - I can ask him if a claim is true. He queries Wikipedia, reads the excerpts, and may only answer: *confirmed, refuted, or unclear*. No using his own knowledge. I respect the honesty
- **Web lookup** - for the things that changed after my model's training data ended, he can invoke it himself or if I ask him to search the web for something specific
- **LED control** - "make the light blue" works. Marvin can set his own LED ring color and effect as well as my smart bulbs in my home.
- **system_check** - this one is my absolte favorites. i can ask Marvin something like "how is the system doing?" and he reads the GPUs, RAM, disk and docker containers of the shed system and tells me if everything is good, what is broken, if there is something that could be a problem he says nothing.. because he broke. My coworker checks up on my server. There is something very right about that. 

When a timer expires, it does not matter that the device was "off" (it never really is, but it could be removed from power between setting the timer and moving it for example): events are queued in a database, and when the device's WebSocket reconnects, it gets a backlog flush. A 7am appointment rings even if I yanked the power plug at 2am. Or after a power surge or unexpected firmware reboot because something went wrong. Queues expire after 6 hours, so a dead device also does not create a decade-old reminder avalanche.

## The memory

This is actually what makes him feel like a coworker instead of a speaker with a brain. Everything is in a SQLite database, plain and small (and actually really fast!):

- every conversation turn is stored! yes.. EVERY SINGLE ONE! 
- every **8 turns**, a background job re-summarizes the current session into a compact German summary (max ~200 words) - "who's who, what was decided, what is still open, what was the topic"
- a full-text index (FTS5) lets him pull the 5 most relevant past turns for the current conversation

This results in: the last ~10 turns verbatim + the rolling summary + keyword-matched history, injected into every prompt. He remembers what I told him three weeks ago (that is the rolling summary job), and he can find specific old facts (that is the search job). Not perfect. Sometimes the summary eats a detail. But he remembers almost eveything and important details can be told to him so he flags them as that and will most likely not overwrite or delete them. (Deteriating memory on a LLM... who would have thought...)

## What is currently still missing

Honest list: vision (screen + webcam) is not wired into this pipeline yet. Speaker recognition is just a folder with my voice reference and a future plan. And no, he is not AGI - I am not pretending he is. He is a voice pipeline with tools, memory and opinions about my hardware. But he can be quirky sometimes.

What is coming: for now a screen with a dashboard, voice indicator, system stats, tool logs and so on. Just to have something i can look at not just  talk to. And maybe... just maybe... one day he will get more. Like a body of some sort.. but that for another time and a whole topic on itself.

Until then: he is in the shed, the LEDs are spinning, and he knows what time it is.
