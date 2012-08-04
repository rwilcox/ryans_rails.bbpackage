Introduction
==========================

Hi, I'm [Ryan Wilcox](http://flavors.me/rwilcox). You may know me as a [long time freelancer](http://www.wilcoxd.com), or as the person behind [@bbedit_hints](http://www.twitter.com/bbedit_hints).

I've been programming Rails for the last 3 years. First with TextMate, then with BBEdit. When I moved back to BBEdit I found many of my TextMate Ruby on Rails tools were gone.

So I started building my own tools for BBEdit - sometimes mirrored after the tools I had in TextMate, sometimes mirrored after Vim's Rails.vim mode, and sometimes something better.

This package has clippings for common items, it has refactoring tools, it has tools to help navigate around your Rails project. It has tools to handle Domain Specific Languages in BBEdit (something BBEdit does poorly).


Supporting Tools
================================

Part of this package assumes you're using my "remove placeholder crap" script, to remove the dross from clippings when you use them.

Not using this already? Check out the [BBEdit Hints Blog entry on it!](http://bbedit-hints.tumblr.com/post/12327257363/more-useful-clipping-placeholders)

I really suggest you install the [Source BBEdit Package](https://github.com/rwilcox/Source.bbpackage) also, as that is meant to provide tools useful in *any* language or framework.

Tools in this package
================================

The Clippings
-----------------------------
If you're used to TextMate's Ruby on Rails bundle many things will feel familiar. The nice way additional lines are auto-created in migrations, for example.

I both love the snippets in TextMate, and can't remember syntax worth a darn, so this area probably has the most work done to it.

### Philosophy behind some of the of the clippings ####

Rails is opinionated, thus some of the clippings used have opinions behind them.

#### `Controllers` -> `before_filter_get_object`####

See [Michael Bleigh's blog post on this](http://www.intridea.com/blog/2011/6/07/conversations-controller-setter-pattern#) - and why he moved away from `helper_method` to `before_filter` for this.

The private method you implement should just do the `find` operation for your object: non find operations (`index`, `new`, `create`) aren't repeating themselves enough in a single controller to unify.

Navigating around: File to File
-------------------------------
There's a filter, the `rails_emacs_modeline` filter. This filter will create an emacs modeline, which (in addition to enforcing some Rails standard style guidelines on any editor that respects modelines) also will let you use BBEdit's Open Counterpart functionality to open the test/spec for the current file.

Already in a spec or test? Open in Counterpart will open the correct implementation file then: be in model, controller, or whatever.

Navigating around: Functions in schema.rb and Rake files
--------------------------------------

You'll find a lot about this package that TextMate didn't do - for example, the function menu works in Rake files and schema.rb. (Showing `task` declarations in the former, and `create_table` declarations in the latter.)


Navigating around: "Functions" in a DSL heavy file
--------------------------------------

One failing of BBEdit - at least for Rails development - is that is doesn't support Domain Specific Languages as well as (say) TextMate. It's much harder to extend the Ruby grammer to add a block construct to the function menu.

But, Rails is very DSL based - wouldn't it be great to see our "test" or "it" blocks on the function menu?

For right now the best solution is my "list rspec or shoulda/test uni statements" scripts. This will scan the current file for matching lines (ie: `test "logging in"`) and output them.

Directly underneath each listed declaration is the full path and line number of the statement. Select the path + line number and File -> Open File By Name.

Refactoring
-------------------------------
There are also a number of tools to help refactor your code - for example, tools to help you split your code out into ActiveSupport::Concerns. The Text Filters involved will actually create a concern module for you (placing it in the same folder as the current document).

Completion Data
------------------------------

This BBEdit Package includes completion data from both Ruby on Rails and Ruby Standard Library. It's not perfect, but it'll make typing Rails class names easier.

This completion data compliments your own completion data. I've included a script - "CTags for current project window" for you to easily create ctags data for your own project (assuming you don't have another solution).


TODO
==============

I want to replicate TextMate's Go To File functionality - being able to go to more than just the test/spec (and back).

Likewise, the completion data is useful, most of the time. I'd like to improve that.

More clippings would be helpful too.

Because of my setup, I don't use scripts that let you fire off rake tasks from your editor, but I understand why should people would want that. I'll leave that up to someone else to implement.

Installation
============

    $ cd Library/Application\ Support/BBEdit/
    $ mkdir Packages # if it doesn't already exists
    $ cd Packages
    $ git clone https://github.com/rwilcox/ryans_rails.bbpackage.git

And restart BBEdit.

Contributing
======================

Please feel free to contribute. However, there is something to keep in mind: BBEdit for some reason doesn't like the uncompiled versions of some Applescripts.

Plus, having BBEdit compile an Applescript every time is much slower than compiling it once.

To avoid this, I've created a ApplescriptSources folder. Modify the .applescript file here, then save a compiled version in the Scripts/git folder.

At some point I'll write a shell script or Makefile to automate this process, or figure out what's wrong...

License
================

Public domain

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
