package main

import (
	"fmt"
	flag "github.com/ogier/pflag"
	"os"
)

var (
	help = flag.BoolP("help", "h", false, "help")
)

func usage() {
	PrintErr("Usage: todo COMMAND [OPTIONS]", "")
	flag.PrintDefaults()
	os.Exit(0)
}

func main() {
	flag.Usage = usage
	flag.Parse()

	if *help {
		usage()
	}
}

func PrintErr(str string, a ...interface{}) {
	fmt.Fprintln(os.Stderr, str, a)
}
