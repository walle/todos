package todo

import (
    "time"
)

const DATE_FORMAT = "2006-01-02 15:04:05 -0700"

// Functions to be able to "mock" time.Now()
// https://gist.github.com/karlseguin/5742394

type NowFunc func() time.Time
var Now = func() time.Time { return time.Now() }

func NowForce(timeValue time.Time) {
  Now = func() time.Time { return timeValue }
}