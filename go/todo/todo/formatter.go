package todo

// Knows how to format items
type Formatter struct {
	items []Item
}

func (formatter *Formatter) String() string {
	ret := ""
	for _, value := range formatter.items {
		ret += value.String()
	}

	return ret
}
