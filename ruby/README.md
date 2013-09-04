# Reference implementation

This is the reference implementation of the todo application.

## Usage

You can point out a file with the -f flag to use as storage. The file will be created if it doesn't exist.
If you don't point out a file a file called items.todo will be created in the current working directory and be used instead.

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

## Running tests

You can use the environment variable $COVERAGE=true to get code coverage using simplecov. The output is placed coverage/.

    $ COVERAGE=true rake

## Generating documentation

You can generate documentation using yard. Either generate them or host them on a local server.

    $ yard # Generates the documentation in doc/
    $ yard server # Starts a web server on port 8808, open http://localhost:8808/ in your browser to see the documentation