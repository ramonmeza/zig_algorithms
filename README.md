# Algorithms Implemented in Zig

Classic algorithms implemented in the [Zig programming language](https://ziglang.org/).

## About

I've been watching an absurd amount of [Primeagen](https://www.youtube.com/c/theprimeagen)
lately and found out they have a [free video course on algorithms](https://frontendmasters.com/courses/algorithms/).
There's no time like the present to learn a new language and brush up on the
fundamentals, so I took this as an opportunity to improve.

As I go through these videos, I listen to the lecture and try to implement the
algorithms myself before watching the solutions. I'd suggest trying the same
before referencing this repo. But, in case you are just curious about Zig,
feel free to look around and copy&paste whatever you need.

## Running the Tests

Obviously you'll need the Zig compiler. Then simply run the tests for whichever
algorithm you want using the following command:

```sh
zig test .\src\<algo>.zig
```

## Todo

Running test command for each source file feels wrong. I need to come up with a
way to run all of the tests at once, and report the results. A batch file would
be the easiest solution, but not really a satisfying one. If someone has suggestions,
please send them my way.
