# Todos

This is a collection (soon to be) of implementations of the same application in different languages.

My motivation is that I want to "learn" (i.e. have experience) more programming languages. I have been looking for ways to do this, and I don't want implement small programs and algorithms in each language I choose to try out. I have to have something more usable/meaningful to motivate me and get a feel for the language.

So this is my idea, I will build the same CLI todo list application in languages I fell like trying out. I will try a new implementation when I feel I got the time, or have to get a break from some other project. All implementations should implement the same features as the Ruby reference implementation before they are considered finished.

An extra challenge I've set up for myself is that every implementation should be developed using Test Driven Development. This is to push me to get more familiar with testing and will give me more insight to working with the language "for real".

## Concepts implementation will touch

Every implementation will give me the opportunity to test out some basic concepts in each language, the concepts in no particular order

* Command line argument processing
* IO
* Regular expressions
* Testing/Mocking framework
* String processing
* Common data structures

## Specification/Protocol

### File format

The file format is pretty straight forward, it contains three types of rows: Tasks, Comments and Spacers and all types span the entire line. The format is human readable/editable.

* Comments starts with #
* Tasks start with * or -, * indicates a open task and - a completed
* Everything else is considered a Spacer

Tasks have the format: [*|-] [Identifier] -!- [Estimated time] -!- [Priority] -!- [Completed at]

### Functionality

All implementations must implement basic CRUD operations (add, show, update, delete) as well as a complete operation to mark tasks as closed

## Reference implementation

The reference implementation is written in Ruby (can be found in [ruby/](https://github.com/walle/todos/blob/master/ruby/)) because that's the language I feel I know the best.

### Trying it out

Requirements for the reference implementation are: ruby and bundler

Checkout the repository and go to the ruby folder, run bundle, run rake if you want to run the test suite, and run the program by executing bin/todo -f /tmp/my_todos.txt (as an example file).

    $ git clone https://github.com/walle/todos.git
    $ cd todos/ruby
    $ bundle install
    $ rake
    $ bin/todo -f /tmp/my_todos.txt

## Planned implementations

See [planned_implementations/](https://github.com/walle/todos/blob/master/planned_implementations/) for a list of implementations I plan to do.

## Finished implementations

Implementations that are started or finished are found in the root of the repository.

Here is a list of the implementations that are finished

* Ruby (Reference implementation)

## Ideas and further development

Nothing right now

## Contributing

I will probably not accept any pull requests for any new implementations, because I want to create them myself. But you are encouraged to fork the repository and create your own implementations. But pointers and helping out when I've started an implementation is greatly appreciated!

Bugfixes and features for the reference implementation will be considered but not guarantied to be accepted.

See [CONTRIBUTING](https://github.com/walle/todos/blob/master/CONTRIBUTING.md) for more information.

## License

All code is under MIT license. See [LICENSE](https://github.com/walle/todos/blob/master/LICENSE) for more information.