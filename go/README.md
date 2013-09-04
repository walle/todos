# Go implementation

## Building

Set up your Go workspace according to the [How to Write Go Code](http://golang.org/doc/code.html) guide.

Symlink the todo directory to your Go workspace src directory

    $ ln -s /absolute/path/to/todos/go/todo $GOPATH/src/todo

Go to the go folder

    $ cd todos/go

Issue the build command and build the binary in the bin folder

    $ go build -o bin/todo todo

Run the application by

    $ bin/todo