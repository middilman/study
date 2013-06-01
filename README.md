# mi study group
Start in the NOTES directory (the box above this one, if you're on github). That's where all
notes for past lessons can be found. Also, the notes for the next lesson will be there.

## Goal
improve our programming skills by meeting weekly and working on programming stuff.

## Topics
- ruby
- ruby on rails
- rspec, cucumber
- coffeescript
- git: forking on github
- unix/linux command line
- development tools / IDEs: RubyMine, vim, sublime text
- managing / setting up a webserver

## Schedule
When:   Every Saturday morning 8-9:30
### *week 5*
Who: Stephen  
When: Sat Apr 13 8:00-9:30 2013  
Where: DevCave  
What:  Programming, from the beginning
-   computers are dumb
-   people are smart
-   programming is just telling the computer what to do
-   (miles) exercise 
    -   can make you smarter
    -   can help you solve stumper problems  

### *week 4*
Who: Stephen  
When: Sat Apr 06 8:00-9:30 2013  
Where: DevCave  
What:  Classes and Objects and Vars, Oh My!
-   Ruby: instance variables 
-   Ruby: static variables and methods
-   Ruby: global variables (why are they evil?)
-   Ruby: arrays and all their nifty functions
    -   a1="this is a bunch of words".split
    -   a2=%w{this is a bunch of words}
    -   a1.join ', '
-   Lots of great stuff last week. Review!

### *week 3*
Who: Stephen  
When: Sat Mar 30 8:00 AM 2013  
Where: DevCave  
What:  
-   Ruby: what does initialize method do?
    - how is it invoked?
    - how is it useful?
-   Ruby idiosyncracies part 1
    -   what does _!_ do?
    -   when _!_ is part of a method name, what does that usually mean?
    -   what does _?_ do?
    -   when _?_ is part of a method name, what does that usually mean?
-   Constants: any string that starts with upper-case letter
    -   legible constants use underscores: ICE_CREAM_FLAVOR = "pralines and cream"
    Variables
    -   start with lower-case letter
    -   by convention, use underscore: current_ = 
-   Ruby: how are variables like pointers?
-   git: diff and git diff --staged
-   git: log and git log -p
-   git: man git-log (note the hyphen)
-   __Garbage Collection__
    - sweep, reference counting
    - memory leaks: (anti pattern) how can one leak memory in Ruby?
-   [symbols](http://rubylearning.com/satishtalim/ruby_symbols.html)
Prep:  
-   read [symbols 1](http://rubylearning.com/satishtalim/ruby_symbols.html)
or  
-   read [symbols 2](http://www.troubleshooters.com/codecorn/ruby/symbols.htm)
or  
-   [pick a better explanation for symbols :-)](https://encrypted.google.com/search?hl=en&q=symbols%20in%20ruby)


### *week 2*
Who: Stephen  
When:  Sat Mar 23 8:00 AM 2013
Where: DevCave  
What:  Ruby and RTanque: __Battle day__  
Prep:  
[ruby-doc.org](http://www.ruby-doc.org/core-2.0/) ::: Bookmark it!   
If you didn't do the quick start (below) before, do it for this time.  
~~Fork [steptan's RTanque github repo](https://github.com/steptan/RTanque)~~ so you can share your bot via pull request  
(actually, the [study](https://github.com/steptan/study) repo has the bots in subdirectory called tank\_bots)  
git@github.com:steptan/RTanque.git  
__come ready to battle__  

### *week 1*
Who: Stephen  
When: Tue Mar 5 6:30 AM 2013  
Where: DevCave  
What: Ruby and RTanque  
Prep:   
Do RTanque (aka tank) **Quick Start:** (below)  

  
## What we've learned
### command line
```bash
ln -s
```
*   create a symbolic link, aka, shortcut
*   ln -s ../study_group/tank_bots

### git
History:  
```git
git log  
```
History with changes:  
```git
git log -p  
```

### [Ruby](http://www.rubyist.net/~slagell/ruby/index.html) basics
* everything in Ruby is an [Object](http://www.ruby-doc.org/core-2.0/Object.html)
* [Object](http://www.ruby-doc.org/core-2.0/Object.html) are created from [Classes](http://www.rubyist.net/~slagell/ruby/classes.html)
* every [Class](http://www.rubyist.net/~slagell/ruby/classes.html) extends another class, all the way back to [Object](http://www.ruby-doc.org/core-2.0/Object.html)  
For example, numbers are objects, too  
arithmetic operators are just method calls  
so + is a method on the Number class  
```ruby
3 + 3 #(is the same as) 
3.+(3)  
```

#### [Constants](http://www.rubyist.net/~slagell/ruby/constants.html)
*   Magic numbers are evil: use Constants instead
*   Constants should not change, though Ruby seems to allow it, complains
    * Class names are constants (everything in Ruby that starts with upper-case letter is a constant.

#### [Symbols](http://rubylearning.com/satishtalim/ruby_symbols.html)
#### Classes
* :: ~~Class-wide~~ edit: see [:: "Scope Operator"](http://en.wikibooks.org/wiki/Ruby_by_examples#::_.28Scope_Operator.29)
    * Class Values accessed by appending :: to class name
    * Static constants: Math::PI
    * Package Declaration

* Classes can be "instantiated" to create "instances" which are [Object](http://www.ruby-doc.org/core-2.0/Object.html)
* Variables point to [Object](http://www.ruby-doc.org/core-2.0/Object.html)
* [Instance variables](http://www.rubyist.net/~slagell/ruby/instancevars.html) persist across method calls and have a @ prepended
    @lives = @lives - 1
* ruby constructor: initialize
* each time a Class is instantiated
  - a new [Object](http://www.ruby-doc.org/core-2.0/Object.html) is born
  - its initialize method is called
  - initialize method takes 1 argument 
```ruby
    def initialize(blah)
      @radar = 0.0
    end
```
* every Class inherits from the [Object](http://www.ruby-doc.org/core-2.0/Object.html) class
* ruby returns the last thing in your method
* [duck typing](http://rubylearning.com/satishtalim/duck_typing.html)
* \+ is actually a method (same for \*, -, / etc)
* every method returns the last thing
* [irb](http://www.ruby-doc.org/docs/ProgrammingRuby/html/irb.html) is a great way to quickly test stuff and learn Ruby from the command line
__ Try this in irb:__  
you can concatenate Strings in Ruby   
```ruby
    "Hi," + " there"
```  
you cannot do this:  
```ruby
    5 + " little monkeys"
```  
why not? duck typing. Ruby finds 5, wants to do arithmetic  
```ruby
    5 + 5
```  
this works:
```ruby
    5.to_s + " little monkeys"
```  

because now Ruby can concatinate 2 Strings: "5" and " little monkeys"  


### markdown
[markdown cheat sheet](http://support.mashery.com/docs/customizing_your_portal/Markdown_Cheat_Sheet)
- to force a line break, end a line with two spaces  
- to make a link, 
    - put the text of the link in square braces  
    - put the link inside parenthesis




## RTanque (aka tank) **Quick Start:**
(run from the command line)  
```bash
mkdir rtanque; cd rtanque  
echo '1.9.3' > .ruby-version  
bundle init  
echo "gem 'rtanque'" >> Gemfile  
bundle  
bundle exec rtanque new_bot my_bot  
bundle exec rtanque start bots/my_bot sample_bots/keyboard sample_bots/camper:x2  
```
*Drive the Keyboard bot with asdf. Aim/fire with the arrow keys*  
[http://awilliams.github.com/RTanque/](http://awilliams.github.com/RTanque/)


## next subjects
-   blocks in ruby
  
  
```ruby  
    (1..5).each {|num| puts 2*num}  
```  
