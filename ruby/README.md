# Reference implementation

This is the reference implementation of the todo application.

## Usage

You can point out a file with the -f flag to use as storage. The file will be created if it doesn't exist.

    Usage: todo COMMAND [OPTIONS]

    Commands
         add: add task
         update: update task information
         complete: mark task as complete
         delete: delete task

    Options
        -f, --file FILE                  which todo file to use
        -i, --identifier IDENTIFIER      the identifier to modify/add
        -n, --new-identifier IDENTIFIER  the new identifier to use
        -e, --estimation ESTIMATION      the estimated time
        -p, --priority PRIORITY          the priority
        -h, --help                       help

## Running

Requirements for the reference implementation are: ruby and bundler

Checkout the repository and go to the ruby folder, run bundle, run rake if you want to run the test suite, and run the program by executing bin/todo -f /tmp/my_todos.txt (as an example file).

    $ git clone https://github.com/walle/todos.git
    $ cd todos/ruby
    $ bundle install
    $ rake
    $ bin/todo -f /tmp/my_todos.txt