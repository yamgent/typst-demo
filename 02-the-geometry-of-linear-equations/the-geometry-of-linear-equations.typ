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
          style: (stroke: (paint: green, thickness: 1.5pt), mark: (end: ">"))
        )
      }
    )
  })
]

Since we already know the solution previously, we know the right combination must be

$ 1 mat(2; -1) + 2 mat(-1; 2) = mat(0; 3) $

The new picture is:

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
          style: (stroke: (paint: green, thickness: 1.5pt), mark: (end: ">"))
        )
        plot.add(
          domain: (-5, 5),
          ((0, 0), (0, 3)),
          label: [$b$],
          style: (stroke: (paint: black, thickness: 2pt), mark: (end: ">"))
        )
        plot.add(
          domain: (-5, 5),
          ((2, -1), (0, 3)),
          label: [$+ 2 dot.op "Col 2"$],
          style: (stroke: (paint: black, thickness: 1pt, dash: "dashed"))
        )
      }
    )
  })
]

I get $arrow(b)$ after adding $2 dot.op "Col 2"$ to $1 dot.op "Col 1"$.

Question: What are all the combinations? If I take all $x$, all $y$, what is the result?

Answer: I can get any vector as the result. It would fill the whole plane $bb(R)^2$ (a vector space).

= 3-Dimensions

Suppose the equations are:

$ 2x - y && &= 0 \ -x + 2y &&-z &= -1 \ -3y &&+4z &= 4 $

How do we understand these equations? Again, we can use the three methods:

== Matrix form

$ A = mat(2, -1, 0; -1, 2, -1; 0, -3, 4) $

$ bold(upright(b)) = mat(0; -1; 4) $

== Row picture

This is getting a bit more complicated, so the drawing is not entirely accurate, but we can imagine that they all meet at a point somehow:

#align(center)[
  #cetz.canvas({
    import cetz.draw: *

    // axes
    line((0, 0), (3, 0))
    mark((3, 0), (4, 0), symbol: ">", stroke: black)
    content((3.5, 0), [y])

    line((0, 0), (0, 3))
    mark((0, 3), (0, 4), symbol: ">", stroke: black)
    content((0, 3.5), [z])

    line((0, 0), (0, 0, 3))
    mark((0, 0, 3), (0, 0, 4), symbol: ">", stroke: black)
    content((0, 0, 3.5), [x])

    // plane 1
    line((1, 2.5), (2, -1))
    line((2, -1), (-0.5, -2))
    line((-0.5, -2), (-1.5, 2))
    line((-1.5, 2), (1, 2.5))

    // plane 2
    line((2, 2), (2.5, -0.5))
    line((2.5, -0.5), (-1.25, -1.5))
    line((-1.25, -1.5), (-2, 1))
    line((-2, 1), (2, 2))

    // plane 3
    line((2, 2.5), (3, 0.5))
    line((3, 0.5), (-0.5, -1.5))
    line((-0.5, -1.5), (-1.75, 1.25))
    line((-1.75, 1.25), (2, 2.5))
  })
]

We can get 3 points from equation 2: $(1, 0, 0)$, $(0, 0, 1)$, $(0, -1/2, 0)$.

3 points form a plane, so each equation is actually a plane.

Two planes meet in a line.

Three planes meet in a point.

We don't know what the point is that they meet, but the main idea is that as the 3 planes are not parallel, they have a solution.

* $star$ The problem with the row picture: it is getting harder to visualize the problem as the amount of dimensions increase.* What about 4D, 5D, etc? Almost impossible.

== Column picture

The #underline[algebra] form of the column picture is:

#math.equation(numbering: "(1)", block: true, $x mat(2; -1; 0) + y mat(-1; 2; -3) + z mat(0; -1; 4) = mat(0; -1; 4)$)<colpicture2>

So it is the linear combination of 3 vectors, and the vectors are 3 dimensions.

The #underline[geometry] form of the column picture is:

#align(center)[
  #cetz.canvas({
    import cetz.draw: *

    // axes
    line((0, 0), (3, 0))
    mark((3, 0), (4, 0), symbol: ">", stroke: black)
    content((3.5, 0), [y])

    line((0, 0), (0, 3))
    mark((0, 3), (0, 4), symbol: ">", stroke: black)
    content((0, 3.5), [z])

    line((0, 0), (0, 0, 3))
    mark((0, 0, 3), (0, 0, 4), symbol: ">", stroke: black)
    content((0, 0, 3.5), [x])

    // col 1
    line((0, 0), (-1, 0, 2), stroke: blue)
    mark((-1, 0, 2), (-2, 0, 4), symbol: ">", stroke: blue)
    content((-1, 0.5, 2), [Col 1])

    // col 2
    line((0, 0), (2, -3, -1), stroke: red)
    mark((2, -3, -1), (4, -6, -2), symbol: ">", stroke: red)
    content((2, -2, -1), [Col 2])

    // col 3
    line((0, 0), (-1, 4, 0), stroke: gray)
    mark((-1, 4, 0), (-2, 8, 0), symbol: ">", stroke: gray)
    content((-1, 4.5, 0), [Col 3])
  })
]

Again, what the set of equation is asking, is to find the right combination to produce $bold(upright(b)) = mat(0; -1; 4)$.

This problem is specially chosen, so that the solution is deliberately $x = 0, y = 0, z = 1$.

#align(center)[
  #cetz.canvas({
    import cetz.draw: *

    // axes
    line((0, 0), (3, 0))
    mark((3, 0), (4, 0), symbol: ">", stroke: black)
    content((3.5, 0), [y])

    line((0, 0), (0, 3))
    mark((0, 3), (0, 4), symbol: ">", stroke: black)
    content((0, 3.5), [z])

    line((0, 0), (0, 0, 3))
    mark((0, 0, 3), (0, 0, 4), symbol: ">", stroke: black)
    content((0, 0, 3.5), [x])

    // col 1
    line((0, 0), (-1, 0, 2), stroke: blue)
    mark((-1, 0, 2), (-2, 0, 4), symbol: ">", stroke: blue)
    content((-1, 0.5, 2), [Col 1])

    // col 2
    line((0, 0), (2, -3, -1), stroke: red)
    mark((2, -3, -1), (4, -6, -2), symbol: ">", stroke: red)
    content((2, -2, -1), [Col 2])

    // col 3
    line((0, 0), (-1, 4, 0), stroke: gray)
    mark((-1, 4, 0), (-2, 8, 0), symbol: ">", stroke: gray)
    content((-1, 4.5, 0), [Col 3 = $bold(upright(b))$])

    // b
    line((0, 0), (-1, 4, 0), stroke: (paint: yellow, thickness: 2pt))
    mark((-1, 4, 0), (-2, 8, 0), symbol: ">", stroke: yellow)
  })
]

Of course, not all problems will have such an obvious solution (next lecture will cover elimination, which will help us systematically solve the equations).

But let's come back to the big picture: what if right-hand side is different?

Change it, such that we add col 1 to col 2:

#math.equation(numbering: "(1)", block: true, $x mat(2; -1; 0) + y mat(-1; 2; -3) + z mat(0; -1; 4) = mat(1; 1; -3)$)<colpicture2>

Solution is $x = 1, y = 1, z = 0$.

What happens to the row picture and col picture?

- In the row picture: 3 new planes, brand new picture. :(
- * $star$ In the col picture: still the same arrows:*

#align(center)[
  #cetz.canvas({
    import cetz.draw: *

    // axes
    line((0, 0), (3, 0))
    mark((3, 0), (4, 0), symbol: ">", stroke: black)
    content((3.5, 0), [y])

    line((0, 0), (0, 3))
    mark((0, 3), (0, 4), symbol: ">", stroke: black)
    content((0, 3.5), [z])

    line((0, 0), (0, 0, 3))
    mark((0, 0, 3), (0, 0, 4), symbol: ">", stroke: black)
    content((0, 0, 3.5), [x])

    // col 1
    line((0, 0), (-1, 0, 2), stroke: blue)
    mark((-1, 0, 2), (-2, 0, 4), symbol: ">", stroke: blue)
    content((-1, 0.5, 2), [Col 1])

    // col 2
    line((0, 0), (2, -3, -1), stroke: red)
    mark((2, -3, -1), (4, -6, -2), symbol: ">", stroke: red)
    content((2, -2, -1), [Col 2])

    // col 3
    line((0, 0), (-1, 4, 0), stroke: gray)
    mark((-1, 4, 0), (-2, 8, 0), symbol: ">", stroke: gray)
    content((-1, 4.5, 0), [Col 3])

    // b
    line((0, 0), (1, -3, 1), stroke: (paint: yellow, thickness: 2pt))
    mark((1, -3, 1), (2, -6, 2), symbol: ">", stroke: yellow)
    content((1, -3.5, 1), [$bold(upright(b))$])

    // dashes
    line((-1, 0, 2), (1, -3, 1), stroke: (dash: "dashed"))
    line((2, -3, -1), (1, -3, 1), stroke: (dash: "dashed"))
  })
]

Now think: can we solve this for *all* right hand side? Is there a solution for all $bold(upright(b))$?

_Formally:_ 

+ Can I solve $A bold(upright(x)) = bold(upright(b))$ for every $bold(upright(b))$?
+ Do the linear combinations of the columns fill entire 3D space?

It appears as if both questions are different from a different POV, but both are actually asking the same thing - I get a combination of the columns.

For this matrix $A$, the answer is YES. (Our example is a non-singular, invertible matrix).

When would the answer be NO? When will I not be able to produce $bold(upright(b))$?

* $star$ If all 3 columns lie on the same plane, then all combinations will still lie on the same plane. *

Another example: Let Col 3 be the sum of Col 1 + Col 2. Col 3 is in the same plane as Col 1 + Col 2. All $bold(upright(b))$ in the same plane as Col 1 + Col 2 are solvable, but $bold(upright(b))$ outside the plane cannot be reached. #math.arrow matrix is *not* invertible.

= n-Dimensions

Pretend that we have 9 equations and 9 unknowns.

== Matrix form

$ underbrace(mat(dots, dots; dots, dots), 9 times 9) underbrace(mat(dots; dots), 9 times 1) = underbrace(mat(dots; dots), 9 times 1) $

== Row picture

We cannot draw this. 9D plane in a 9D space? We give up at this stage.

== Col picture

It is just 9 columns, so 9 vectors in 9D space, and we would still be finding their linear combination to hit $bold(upright(b))$.

We can also still ask: can we get all RHS $bold(upright(b))$?

If columns chosen are not independent: Col 9 is the same as Col 8, then Col 9 contributes nothing new, possible to have a $bold(upright(b))$ that I cannot get.

Think about 9 vectors in 9D, take combination - this is the central thought in linear algebra. Even though 9D space is still hard to visualize (like in row picture), we can still easily visualize the vectors.

* $star$ In Col picture, everything is still just arrows, making visualization less of a problem. *

= Matrix Form of the Equation

Up till now, we have been using a very core concept that we haven't explore.

How to multiple a matrix by a vector? For example:

$ mat(2, 5; 1, 3) mat(1; 2) $

2 ways:

+ Rows way / dot product (which is what we usually learn first): $ mat(2 * 1 + 5 * 2; 1 * 1 + 3 * 2) = mat(12; 7) $
+ Columns way (what we have been doing the entire lecture): $ 1 mat(2; 1) + 2 mat(5; 3) = mat(12; 7) $

The columns way is basically saying that $A bold(upright(x))$ is a combination of the columns of $A$.

In linear algebra, columns way of thinking is more useful.
