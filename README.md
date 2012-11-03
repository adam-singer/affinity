Affinity
========

A set of geometric primitives for [dart](http://www.dartlang.org/).

Affinity uses the MIT license as described in the LICENSE file, and 
[semantic versioning](http://semver.org/).

Efficient Geometry
------------------

Everyone loves to write these classes.  Vector, Rectangle, etc... are familiar
to most every programmer and they are easy to reason about.  It is therefore
tempting to simply roll your own for your own needs.  However, this makes it
more difficult to interoperate with other libraries who have also rolled their
own such classes.  Thus, i've written Affinity with the following goals:

- 100% unit test coverage.
- Micro benchmarks ensure performance improves rather than degrades over time.
- Only constructors (including factory constructors) may allocate memory.
- Focus on *useful* constructs, in particular those for 2D graphics.

I plan to take a conservative approach to the amount of classes and functions
in this library; i.e. it shall not be a dumping ground for any sort of geometric
code.  Rather, it will remain true to the above goals and focus on the most
commonly used structures.