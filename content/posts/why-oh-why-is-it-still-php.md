---
title: "Why! Oh why! ...is it still PHP"
date: 2026-03-16T14:51:12+01:00
draft: true
toc: false
images:
tags:
  - php  
  - shopware  
  - ecommerce  
  - development  
---
You know that moment when you mention your tech stack at a developer meetup and you see people's eyebrows raise? Yeah, that's what happens when I say I still work with PHP daily, especially for my Shopware projects.

It's been over a decade since I first encountered Shopware 4.2 back in 2014. I was working on a migration project for a mid-sized retailer that was just acquired by a larger company and now they wanted to use SSO for their main website and for their shop customers. Nobody called it SSO back then but it effectively was just another SSO system. At the time, choosing PHP felt natural - it was (and still is) the language powering a huge portion of the web, and Shopware was built on it.

Fast forward to today, and I've seen PHP evolve from what many considered a "scripting language for simple websites" to a mature ecosystem capable of handling complex enterprise applications. The release of PHP 7 was a game-changer - suddenly we had performance that could compete with other backend languages, plus proper type hinting that made larger codebases manageable.

When it comes to my Shopware work specifically, PHP makes perfect sense for several reasons:
First, Shopware itself is a PHP application. While they've been gradually modernizing their stack (introducing Symfony components, moving toward a more modular architecture with vue and twig), the core is still PHP. Trying to fight against the grain of the platform you just create unnecessary friction that can be circumvented by just using what is provided and works.
Second, the PHP ecosystem around ecommerce is surprisingly rich. From payment gateway integrations to ERP connectors, most services still provide PHP SDKs or have REST APIs that are trivial to consume from PHP. When I need to connect Shopware to a client's inventory management system or accounting software, I rarely find myself lacking for tools or libraries.
Third, and perhaps most importantly for my work, PHP excels at the kind of rapid development and iteration that ecommerce projects often require. When a client needs a custom promotion rule implemented yesterday or a special product display tweaked for a seasonal campaign, PHP's low ceremony nature lets me get changes deployed quickly without sacrificing maintainability.

Sure, PHP has its quirks. The inconsistent naming conventions in the standard library, the historical baggage from earlier versions, and yes, there are still developers who judge the language based on PHP 5.2 tutorials from 2008. But modern PHP (8.4+ as of this writing) addresses many of these concerns with features like attributes, match expressions, constructor property promotion, and improved type system. Heck we are even on the brink of real multithreading in the core of the language. (crossing my fingers for True Async in PHP 8.6)
The reality is that for my specific niche - building and customizing Shopware stores for clients who need reliable, maintainable ecommerce solutions - PHP continues to be the right tool for the job. It's not about being trendy or using the newest shiny thing; it's about choosing technology that lets me solve business problems effectively.

And honestly? After all these years, there's something satisfying about seeing a line of PHP code I wrote in 2015 still chugging along in a production Shopware store, powering transactions and helping businesses grow. Sometimes the old faithful really is the best choice.

Now if you'll excuse me, I have a custom plugin to update for a client that needs to show pricelist for a subset of his articles.
