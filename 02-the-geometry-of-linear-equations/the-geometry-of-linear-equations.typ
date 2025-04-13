#import "@preview/noteworthy:0.2.0": noteworthy, definition, example, exercise
#import "@preview/tablex:0.0.9": *
#import "@preview/cetz:0.3.4"
#import "@preview/cetz-plot:0.1.1": plot

#show: noteworthy.with(
  author: "Tan Wang Leng (Scribe)",
  title: "Linear Algebra: The Geometry of Linear Equations"
)

My notes for the Linear Algebra: The Geometry of Linear Equations, by Professor Gilbert Strang. All scribing errors are mine.

= Introduction

The fundemental problem of linear algebra is: given $n$ linear equations, solve for $n$ unknowns.

There are three ways of looking at the problem:

+ Matrix form
+ Row picture (1 equation at a time)
+ * $star$ Column picture (the most important method of this course, also the best way)*

= 2-Dimensions

Suppose the equations are:

$ 2x - y &= 0 \ -x + 2y &= 3 $

== Matrix form

// use this so that we do not have to manually pass in delim every time
// we use $ mat $.
//
// this shortens the calls from:
//
//    $ mat(delim: "[", 2, -1; -1, 2) $
//
// to:
//
//   $ mat (2, -1; -1, 2) $
#set math.mat(delim: "[")

$ underbrace(mat(2, -1; -1, 2), A) underbrace(mat(x; y), bold(upright(x))) = underbrace(mat(0; 3), bold(upright(b))) $

== Row picture

One line for each equation, can be graphed out in a 2d graph. Both equations will meet at a point $x = 1, y = 2$, which is the solution.

#align(center)[
  #cetz.canvas({
    import cetz.draw: *

    plot.plot(
      size: (5, 5),
      x-tick-step: 1,
      y-tick-step: 1,
      x-grid: "both",
      y-grid: "both",
      y-min: -4,
      y-max: 4,
      x-min: -4,
      x-max: 4,
      axis-style: "school-book",
      {
        plot.add(
          domain: (-5, 5),
          t => (0.5 * t, t),
          label: [$2x - y = 0$],
          style: (stroke: (paint: blue, thickness: 1.5pt)),
        )
        plot.add(
          domain: (-5, 5),
          t => (2 * t - 3, t),
          label: [$-x + 2y = 3$],
          style: (stroke: (paint: green, thickness: 1.5pt))
        )
      }
    )
  })
]

== Column picture

The #underline[algebra] form of the column picture is:

#math.equation(numbering: "(1)", block: true, $x mat(2; -1) + y mat(-1; 2) = mat(0; 3)$)<colpicture1>

where $mat(2; -1)$ (Col 1) and $mat(-1; 2)$ (Col 2) are columns of the matrix. Hence, @colpicture1 is asking us to find the right _linear combinations_ of the columns to get $mat(0; 3)$.

* $star$ Linear combinations is the entire meat of this course.*

The #underline[geometry] form of the column picture is:

#align(center)[
  #cetz.canvas({
    import cetz.draw: *

    plot.plot(
      size: (5, 5),
      x-tick-step: 1,
      y-tick-step: 1,
      x-grid: "both",
      y-grid: "both",
      y-min: -4,
      y-max: 4,
      x-min: -4,
      x-max: 4,
      axis-style: "school-book",
      {
        plot.add(
          domain: (-5, 5),
          ((0, 0), (-1, 2)),
          label: [Col 1],
          style: (stroke: (paint: blue, thickness: 1.5pt), mark: (end: ">")),
        )
        plot.add(
          domain: (-5, 5),
          ((0, 0), (2, -1)),
          label: [Col 2],
          style: (stroke: (paint: green, thickness: 2pt), mark: (end: ">"))
        )
      }
    )
  })
]

Since we already know the solution previously, we know the right combination must be

$ 1 mat(2; -1) + 2 mat(-1; 2) = mat(0; 3) $
