package todo

import (
	"strings"
	"time"
)

type Parser struct {
}

func (parser *Parser) Parse(text string) []Item {
	items := []Item{}

	lines := strings.Split(text, "\n")

	for _, line := range lines {
		first := ""
		if len(line) > 0 {
			first = string(line[0])
		}
		switch first {
		case "#":
			items = append(items, NewComment(line[1:len(line)]))
		case "*":
			task_string := line[1:len(line)]
			parts := strings.Split(task_string, "-!-")
			task := Task{identifier: strings.Trim(parts[0], " -!- "), estimated_time: strings.Trim(parts[1], " -!- "), priority: strings.Trim(parts[2], " -!- ")}
			items = append(items, task)
		case "-":
			task_string := line[1:len(line)]
			parts := strings.Split(task_string, "-!-")
			completed_at, _ := time.Parse(DATE_FORMAT, parts[3])
			task := Task{identifier: strings.Trim(parts[0], " -!- "), estimated_time: strings.Trim(parts[1], " -!- "), priority: strings.Trim(parts[2], " -!- "), completed_at: completed_at}
			items = append(items, task)
		default:
			items = append(items, NewSpacer())
		}
	}

	return items
}
