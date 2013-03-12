# mi study group

We will improve our programming skills by meeting weekly and working on programming stuff.

## Topics
- ruby
- ruby on rails
- rspec, cucumber
- coffeescript
- git: forking on github
- unix/linux command line
- development tools / IDEs: RubyMine, vim, sublime text
- managing / setting up a webserver
- IRC: limechat

## Schedule
### week 1
Who: Stephen  
When:  
Where: DevCave  
What:  
Prep:  


### week 1
Who: Stephen  
When: Tue Mar 5 6:30 AM 2013  
Where: DevCave  
What: Ruby and RTanque  
Prep:   
  
##### Quick Start:
$ mkdir rtanque; cd rtanque  
$ echo '1.9.3' > .ruby-version  
$ bundle init  
$ echo "gem 'rtanque'" >> Gemfile  
$ bundle  
$ bundle exec rtanque new_bot my_bot  
$ bundle exec rtanque start bots/my_bot sample_bots/keyboard sample_bots/camper:x2

*Drive the Keyboard bot with asdf. Aim/fire with the arrow keys*


[http://awilliams.github.com/RTanque/](http://awilliams.github.com/RTanque/)


## Challenge questions (put your name next to the answer if you're first)

-   Why doesn't 'git status' complain about the rtanque subfolder?  
	ANSWER:  You have the folder "/rtanque/*" listed in the .gitignore file.  Miles

## What we've learned so far:

### week 1

#### [Ruby](http://www.rubyist.net/~slagell/ruby/index.html)
##### Ruby basics
* everything in Ruby is an [Object](http://www.ruby-doc.org/core-2.0/Object.html)
* [Object](http://www.ruby-doc.org/core-2.0/Object.html) are created from [Classes](http://www.rubyist.net/~slagell/ruby/classes.html)
* every [Class][http://www.rubyist.net/~slagell/ruby/classes.html) extends another class, all the way back to [Object](http://www.ruby-doc.org/core-2.0/Object.html)
For example, numbers are objects, too  
arithmetic operators are just method calls  
so + is a method on the Number class  
3 + 3 (is the same as) 3.+(3)  

##### Classes
* Class-wide values accessed by appending :: to class name
    * Static constants: Math::PI
    * Static methods: [Random](http://ruby-doc.org/core-2.0/Random.html).rand
* Classes can be "instantiated" to create "instances" which are [Object](http://www.ruby-doc.org/core-2.0/Object.html)
* Variables point to [Object](http://www.ruby-doc.org/core-2.0/Object.html)
* [Instance variables](http://www.rubyist.net/~slagell/ruby/instancevars.html) persist across method calls and have a @ prepended
    @lives = @lives - 1
* ruby constructor: initialize
* each time a Class is instantiated
  - a new [Object](http://www.ruby-doc.org/core-2.0/Object.html) is born
  - its initialize method is called
  - initialize method takes 1 argument 

    def initialize(blah)
      @radar = 0.0
    end

* every Class inherits from the [Object](http://www.ruby-doc.org/core-2.0/Object.html) class
* ruby returns the last thing in your method
* [duck typing](http://rubylearning.com/satishtalim/duck_typing.html)
* + is actually a method (same for *, -, / etc)
* every method returns the last thing
* [irb](http://www.ruby-doc.org/docs/ProgrammingRuby/html/irb.html) is a great way to quickly test stuff and learn Ruby
__ Try this in irb:__  
you can concatenate Strings in Ruby 
    "Hi," + " there"
you cannot do this:
    5 + " little monkeys"
why not? duck typing. Ruby finds 5, wants to do arithmetic
    5 + 5
works, because now it can do arithmetic
    5.to_s + " little monkeys"



### week 0
#### markdown (what this readme is written in)
- [cheat sheet](http://support.mashery.com/docs/customizing_your_portal/Markdown_Cheat_Sheet)
to force a line break, end a line with two spaces  
to make a link, 
- put the text of the link in square braces  
- put the link inside parenthesis


