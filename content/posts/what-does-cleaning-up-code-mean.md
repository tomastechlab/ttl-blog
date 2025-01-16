---
title: "What does cleaning up Code mean?"
date: 2024-12-04T10:23:44+01:00
draft: false
toc: false
images:
tags:
  - code
---
If you work with developers you might have heard the phrase 
> I just need to clean up my code and then its good to go
or something similar. Probably in the context of a feature or software gets fnished and is ready to deploy.

But what does that actually mean?
Is the developer actually cleaning its code? Like sweeping it with a digital broom? or polishing it with an old leather rag like a barkeeper in those classic western movies?

The answer might surprise you but its "no".
But what is "cleaning code" then?

Its pretty easy to understand but hard to define as it really depends on what the task was.
But for the sake of simplicity I will give you a simple example and use it to describe what cleaning up code means in this particular case.

Look at the following Code: 
```python
def do_thing(a, b):
    x = 0
    for i in range(a):
        x += b * 2
    return x

y = do_thing(5, 10)
print(y)
```
Can you tell me what its supposed to do without checking every code path?

There are several unclean things about this. But lets pick this apart one by one.

##Function Name

Starting with the function definition `do_thing`. Its a great name right? Because everybody knows exactly what it is used for.
Just put it in your code, call `do_thing` and it does its thing. Awesome! 
I'm being sarcastic here if you havent noticed.
`do_thing` is probably one of the worst names a function can have. The only times I would consider it a valid name when its context is always clear or it will be changed before anybody else gets access to it. Therefore, after it is *cleaned*.

Even `calculate` would be a better name, but not the best, in this case. 
So clean code has *understandable function names*

##Variables

Whats next? Can you tell me what the variables a, b, x or y are used for? Or what values they store? Without checking each usage? 
Just as I thought, the answer is most likely no.

Much better names, but still maybe not perfect, would be
a - multiplier 
b - iterations
x - sum or total
y - calculated_sum or result

This would make the code much more readable and understandable on what its purpose is.

## It just works! Please use types if possible 

Did you realize that this code will always work? I mean, like always always? Thats the power of typeless programming! 
Want to multiply 'a'? We got you. 
Want to multiply with a hash? No worries.
As this is such a great function, it will handle all these things and more!

I'm being sarcastic again. I'm an advocate for strongly typed variables and in this case we can add them safely. 
I know that there are edge cases where you might not be able to add types. But this mostly because either the language you use simply has no types (looking at you php 5.6 and javascript) or your code base is somehow in such a messy state that nobody, not even your compiler/interpreter, can tell what data is supposed to be in a variable.

This will prevent a lot of errors when using this function. In our example we only add one datatype to the codebase. Integers.
We could maybe add floats but then I would say make 'em all floats or leave it.

But for the sake of simplicity we just use ints here.

## Sugar
What I mean by sugar is output and comments. 
Output is for the user (maybe for other developers if we talk about error messages) and comments are for developers who want to use this function.

### User Output
Lets improve the output first. 
Instead of just putting the result on the commandline we should add some context to it. 
Maybe prefix the value by something like: "The calculated total is: "
This would give a bit of context to what the number on the screen actually is. Even better would be something like
"The calculated output of {multiplier} after {interations} interations is {result}"
This would add even more context to what happend behind the scenes. 


### Comments
If you like, you can comment your code. But this is a trait in itself. Good comments help to understand the code and its useage.
Bad comments explain what the code does.
Code usually explains itself if written properly. Most of the time there is no need to explain what a function does internally.
What matters more is "What parameters does this function accept?" and "What will be returned by the function?"
If these two questions are answered, I bet most developers are able to use it.
A good comment for our funtion would maybe be something like this:
```
Calculate the total value by incrementing a sum based on the multiplier.

Args:
    multiplier (int): Number of iterations to perform.
    increment (int): Value to multiply and add during each iteration.

Returns:
    int: The calculated total value.
```
This comment exlains what I can pass into the function and for what purpose. 
And it also tells me what the function returns, if successful.
There is even a little description of the purpose this function serves.  


### Errors
As already mentioned this does not only apply to outout that is meant for the user. Error Messages are a very important tool in finding issues with the code or even specific values that get passed into the function. 
So make sure to add as much context as possible to an Error BUT(!) be careful with this. Not every bit of context is helpful. 
Always show enough information on your error to understand what went wrong and why it (most likely) went wrong.

## Cleaning up Code
All these steps are done when cleaning up code. Their might be more, depending on the project and code. 
But what cleaning up code roughly means is to make sure that code is readable and usable in the foreseeable future.
Not only for the developer that creates the code, but mostly for developers that will need to read or use the code later.

## Conclusion
After all, my suggestions are discussed widely on the internet and in meetings around the world. You can find a lot (and I mean A LOT!) of information on every single aspect of what I listed out here.
But what they all have in common is a baseline that I like to summarize as 

> "Write your code as if the next one that has to work with it is a psychopathic axe murderer and he knows where you live" 

No sarcasm this time (ok, maybe a little bit). But you get the point.
Write nice code if possible and dont make the life of others hard on purpose.


Before I forget, here is a cleaned version of the code from above. 
It is not perfect at all, but still way better than the original:
```python
def calculate_total(multiplier: int, increment: int) -> int:
    """
    Calculate the total value by incrementing a sum based on the multiplier.

    Args:
        multiplier (int): Number of iterations to perform.
        increment (int): Value to multiply and add during each iteration.

    Returns:
        int: The calculated total value.
    """
    total = 0
    for _ in range(multiplier):
        total += increment * 2
    return total

    # TODO: make this configurable by the user
    iterations = 5
    increment_value = 10

    # Perform calculation
    total_value = calculate_total(iterations, increment_value)
    
    # Output the result
    print(f"The calculated output of {multiplier} after {interations} interations is {total_value}")
```
