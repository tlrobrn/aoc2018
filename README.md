# AdventOfCode 2018

## Run a puzzle

In order to run a puzzle for a star on a given day, run the task:

```bash
$ mix star DAY STAR
```

For example, to run Day 3 Star 2 you would enter: `$ mix star 3 2`

## Start a new puzzle implementation

The `gen.day` task will start a new day's implementation for you by setting up some scaffolding.

```bash
$ mix gen.day DAY
```

For example, to setup scaffolding for Day 7, you would enter: `$ mix gen.day 7`

This would create:

```
lib/day7.ex
lib/day7/part1.ex
lib/day7/part2.ex

test/day7_test.exs
test/day7/part1_test.exs
test/day7/part2_test.exs
```

## Existing Tools

* `AdventOfCode` provides functionality to stream a file line by line.
* `AdventOfCode.Day` will inject a method for each part of the daily challenge. Custom parsing logic (per line) can be implemented in a `parse/1` function _before_ using `AdventOfCode.Day`.

