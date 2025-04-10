#import "@preview/noteworthy:0.2.0": noteworthy, definition, example, exercise

#show: noteworthy.with(
  author: "Tan Wang Leng (Scribe)",
  title: "Introductory Calculus"
)

My notes for the Introductory Calculus: Oxford Mathematics 1st Year Student Lecture, by Professor Dan Ciubotaru. All scribing errors are mine.

= ODEs

ODEs = ordinary differential equations.

#definition[
  An ODE is a kind of equation that involves the independent variable $x$, a function of $x$ (call it $y$, a dependent variable), and the derivatives of $y$ w.r.t. $x$.
]

#example[
  Common ODE forms include:

  $ frac(dif y, dif x), frac(dif^2 y, dif x^2), dots $
]

The highest order of degree is the order of the differential equation. (Hence, $frac(dif^2 y, dif x^2)$ is of order 2).

The simpliest kind of ODE is of the form: $frac(dif y, dif x) = f(x)$, which can be solved by direct integration: $y = integral f(x) dif x$. ($y$ is the anti-derivative of $f(x)$).

== Applications of ODEs

#example[
  From physical sciences, mechanics, the Newton's second law says that:

  $ accent(F, arrow) = m accent(a, arrow) $

  where

  - $accent(a, arrow)$ = acceleration (a derivative of velocity wr.t. time).
  - $accent(a, arrow) = frac(dif accent(v, arrow), dif t)$ (where $accent(v, arrow)$ = velocity)
  - $accent(v, arrow) = frac(dif accent(r, arrow), dif t)$ (where $accent(r, arrow)$ = displacement)
  - $therefore accent(a, arrow) = frac(dif^2 accent(r, arrow), dif t^2)$ (which is a second order equation)
]

#example[
  From engineering, electrical circuits, we have a simple series circuit (RLC).

  #align(center)[#image("circuit.svg", width: 40%)]

  where

  - capacitor $C$ has capacitance
  - resistor $R$ has resistance
  - inductor $L$ has inductance

  $R$, $L$, $C$ are constants, independent of time.

  We are interested in the current of the circuit $I(t)$ (dependent variable), which is the current across the circuit function of time $t$ (independent variable).

  Let $Q(t)$ = charge on the capacitor.

  The relationship is:

  $ I = frac(dif Q, dif t) $

  The Kirchhoff's law states: total voltage is 0 across the circuit.

  $ V(t) = V_R + V_L + V_C $

  where

  - $V_K = R dot.op I(t)$ (ohm's law)
  - $V_L = L dot.op frac(dif I, dif t)$ (faraday law)
  - $V_C = frac(1, C) dot.op Q(t)$

  We can rewrite the equation of $V(t)$ using $Q(t)$ to make it become a differential equation:

  $ L dot.op frac(dif^2 Q, dif t^2) + R dot.op frac(dif Q, dif t) + frac(1, C) dot.op Q = V $

  This is a second order differential equation (the highest derivative is $frac(dif^2 Q, dif t^2)$). It has constant coefficients, and is imhomogenous ($V$ does not have to be 0).
]

#exercise[
  Write the rate at which a radioactive substance decays is proportional to the remaining number of atoms. What is the ODE for the rate?
]

= Review of simplest integration

Simplest is where direct integration is possible.

== Integration by parts

It comes from the product rule for derivative (Leibniz rule).

Suppose two functions $f$ and $g$.

$
  (f dot.op g)' &= f' dot.op g + f dot.op g' \
  => f dot.op g' &= (f dot.op g)' - f' dot.op g text(#h(1cm) "(integrate both sides)") \
  therefore integral f dot.op g' dif x &= f dot.op g - integral f' dot.op g dif x
$

or the definite integral version:

$ integral_a^b f dot.op g' dif x = [f dot.op g]_a^b - integral_a^b f' dot.op g dif x $

#example[
  $ I = integral underbrace(x^2, f) underbrace(sin x, g') dif x $

  Hence $g = -cos x$.

  Hence, using the integration by parts:

  $
    I &= x^2(-cos x) - integral 2 x (-cos x) dif x \
      &= -x^2 cos x + 2 integral underbrace(x, f_2) underbrace(cos x, g'_2) dif x \
      &= -x^2 cos x + 2(x sin x) - 2 integral sin x dif x \
      &= -x^2 cos x + 2 x sin x + 2 cos x + C
  $
]

