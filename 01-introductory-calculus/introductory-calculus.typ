#import "@preview/noteworthy:0.2.0": noteworthy, definition, example, exercise
#import "@preview/tablex:0.0.9": *

#show: noteworthy.with(
  author: "Tan Wang Leng (Scribe)",
  title: "Introductory Calculus"
)

#set math.equation(numbering: "(1)", number-align: bottom, supplement: [Eq.])

My notes for the Introductory Calculus: Oxford Mathematics 1st Year Student Lecture, by Professor Dan Ciubotaru. All scribing errors are mine.

= ODEs

ODEs = ordinary differential equations.

#definition[
  An ODE is a kind of equation that involves the independent variable $x$, a function of $x$ (call it $y$, a dependent variable), and the derivatives of $y$ w.r.t. $x$.
]

// fractions can be $(dif y) / (dif x)$ or $frac(dif y, dif x)$
// I use frac() most of the time because it looks cleaner to me 
// (most fractions are complicated and requires bracketing their 
// content up if we just use / instead of frac())
#example[
  Common ODE forms include: 
  
  // we don't want to use equation numbering for this content (because it
  // is technically not an equation...), hence we need to call math.equation()
  // manually instead of using $$.
  #math.equation(numbering: none, block: true)[$(dif y) / (dif x), frac(dif^2 y, dif x^2), dots$]
]

The highest order of degree is the order of the differential equation. (Hence, $frac(dif^2 y, dif x^2)$ is of order 2).

The simplest kind of ODE is of the form: $frac(dif y, dif x) = f(x)$, which can be solved by direct integration: $y = integral f(x) dif x$. ($y$ is the anti-derivative of $f(x)$).

== Applications of ODEs

#example[
  // notice that equations don't need to be on a new line to 
  // force it to be on a new line. Just need to add spacing.
  // (i.e, instead of $x$, do $ x $).
  //
  // but of course, in some situations it may not look that
  // tidy, so recommend to still use newline wherever possible
  From physical sciences, mechanics, the Newton's second law says that: $ arrow(F) = m arrow(a) $

  where

  - $arrow(a)$ = acceleration (a derivative of velocity wr.t. time).
  #v(0.1em)
  - $display(arrow(a) = frac(dif arrow(v), dif t))$ (where $arrow(v)$ = velocity)
  #v(0.2em)
  - $display(arrow(v) = frac(dif arrow(r), dif t))$ (where $arrow(r)$ = displacement)
  #v(0.2em)
  - $display(therefore arrow(a) = frac(dif^2 arrow(r), dif t^2))$ (which is a second order equation)
]

#example[
  From engineering, electrical circuits, we have a simple series circuit (RLC).

  #align(center)[#figure(image("circuit.svg", width: 40%), caption: [An example circuit]) <circuit>]

  where from the symbols in @circuit:

  - capacitor $C$ has capacitance
  - resistor $R$ has resistance
  - inductor $L$ has inductance

  $R$, $L$, $C$ are constants, independent of time.

  We are interested in the current of the circuit $I(t)$ (dependent variable), which is the current across the circuit, w.r.t. function of time $t$ (independent variable).

  Let $Q(t)$ = charge on the capacitor.

  The relationship is: $ I = frac(dif Q, dif t) $

  The Kirchhoff's law states: total voltage is 0 around the circuit.

  $ V(t) = V_R + V_L + V_C $

  where

  - $V_R = R dot.op I(t)$ (ohm's law)
  - $V_L = L dot.op frac(dif I, dif t)$ (faraday's law)
  - $V_C = frac(1, C) dot.op Q(t)$

  We can rewrite the equation of $V(t)$ using $Q(t)$ to make it become a differential equation:

  $ L dot.op frac(dif^2 Q, dif t^2) + R dot.op frac(dif Q, dif t) + frac(1, C) dot.op Q = V $

  This is a second order differential equation (the highest derivative is $frac(dif^2 Q, dif t^2)$). It has constant coefficients ($L$, $R$ and $C$), and is inhomogeneous ($V$ does not have to be 0).
]

#exercise[
  The rate at which a radioactive substance decays is proportional to the remaining number of atoms. What is the ODE for the rate?
]

= Review of simplest integration

Simplest is where direct integration is possible.

== Integration by parts

It comes from the product rule for derivative (Leibniz rule).

Suppose two functions $f$ and $g$.

$
  (f dot.op g)' &= f' dot.op g + f dot.op g' \
  => f dot.op g' &= (f dot.op g)' - f' dot.op g #h(1em) "(integrate both sides)" \
  therefore integral f dot.op g' dif x &= f dot.op g - integral f' dot.op g dif x
$

or the definite integral version:

$ integral_a^b f dot.op g' dif x = lr([f dot.op g], size: #200%)_a^b - integral_a^b f' dot.op g dif x $

#example[
  $ I = integral underbrace(x^2, f) underbrace(sin x, g') dif x $ <parts-example1>

  @parts-example1 gives the solution to $display(frac(dif y, dif x) = x^2 sin x)$.

  For @parts-example1, $g = -cos x$.

  Hence, using the integration by parts:

  $
    I &= x^2(-cos x) - integral 2 x (-cos x) dif x \
      &= -x^2 cos x + 2 integral underbrace(x, f_2) underbrace(cos x, g'_2) dif x \
      &= -x^2 cos x + 2(x sin x) - 2 integral sin x dif x \
      &= -x^2 cos x + 2 x sin x + 2 cos x + C
  $
]

#example[
  $ I = integral underbrace((2x - 1), g') underbrace(ln(x^2 + 1), f) dif x $

  We want to get rid of $ln$, hence the selection of $f$ and $g'$, and $g = x^2 - x$.

  $ 
    I &= (x^2 - x) ln (x^2 + 1) - integral (x^2 - x) dot.op frac(2x, x^2 + 1) dif x \
      &= (x^2 - x) ln (x^2 + 1) - 2 underbrace(integral frac(x^3 - x^2, x^2 + 1) dif x, J)
  $

  Do long division for the fraction in $J$.

  #align(center, block[
    #tablex(columns: 5, auto-lines: false, stroke: 0.5pt, align: right,
      $x^3$, $-x^2$, [], [], vlinex(), $x - 1$,
      hlinex(start: 4, end: 5),
      $-x^3$, [], $-x$, [], $x^2 + 1$,
      hlinex(end: 4),
      [], $-x^2$, $-x$, [], [],
      [], $x^2$, [], $1$, [],
      hlinex(start: 1, end: 4),
      [], [], $-x$, $1$
    )
  ])

  $display(=> frac(x^3 - x^2, x^2 + 1) = (x - 1) + frac(-x + 1, x^2 + 1))$

  #v(1em)

  #line(stroke: 0.5pt)

  $
    J &= integral [(x - 1) + frac(-x + 1, x^2 + 1)] dif x \
      &= frac(1, 2) x^2 - x - underbrace(integral frac(x, x^2 + 1) dif x, L) + underbrace(integral frac(dif x, x^2 + 1), arctan x (= tan^(-1) x))
  $

  Solve $L$ by substitution rule: $u = x^2 + 1 => frac(dif u, dif x) = 2x$.

  $
    L &= integral frac(x, x^2 + 1) dif x \
      &= frac(1, 2) integral frac(dif u, u) \
      &= frac(1, 2) ln abs(u) \
      &= frac(1, 2) ln (x^2 + 1)
  $

  $ therefore J = frac(1, 2) x^2 - x - frac(1, 2) ln (x^2 + 1) + tan^(-1) x + C $
  $ therefore I = (x^2 - x) ln (x^2 + 1) - x^2 + 2x + ln (x^2 + 1) - 2 tan^(-1) x + C #h(1em) square.stroked $
]

There are some cases where both $f$ & $g$ will not get simplified, but you do it twice, it will come back to _what you started with_ (see the next example).

#example[
  $ 
    I = integral underbrace(e^x, f) underbrace(sin x, g') dif x
  $

  If you integrate $sin x -> -cos x$, $-cos x -> -sin x$, then can equal each other to find actual answer:

  $ 
    I &= ... \
    &= frac(1, 2) e^x (sin x - cos x) + C
  $
]

More difficult problems cannot solve in one go, need to find recursive formula.

#example[
  Reduction/recursive formula

  (We will label it as $I_n$, because we can get $I_(n-1), I_(n-2)$, etc)

  $
    I_n &= integral cos^n x dif x \
        &= integral underbrace(cos^(n-1) x, f) underbrace(cos x, g') dif x \
        &= cos^(n-1) x sin x - integral (n-1) cos^(n-2) x (-sin x) sin x dif x \
        &= cos^(n-1) x sin x + (n - 1) integral cos^(n-2) x underbrace(sin^2 x, = 1 - cos^2 x) dif x \
        &= cos^(n-1) x sin x + (n - 1) underbrace(integral cos^(n-2) x dif x, I_(n-2)) - (n-1)underbrace(integral cos^n x dif x, I_n)
  $

  Solve for $I_n$:

  $
    n I_n = cos^(n-1) x sin x + (n - 1) I_(n-2)
  $

  Recursive formula:

  $
    I_n = frac(1, n) cos^(n-1) x sin x + frac(n-1, n) I_(n-2)
  $
  where $n >= 2$.

  We also need to know $I_0$ & $I_1$, as it drops down by 2 each iteration, so these are base cases.

  $ I_0 = integral dif x = x (+ C) $

  $ I_1 = integral cos x dif x = sin x (+ C) $

  With that, we can get any integral we want. For example:

  $
    I_6 &= frac(1, 6) cos^5 x sin x + frac(5, 6) I_4 \
        &= frac(1, 6) cos^5 x sin x + frac(5, 6) (frac(1, 4) cos^3 x sin x + frac(3, 4) I_2)
  $

  $
    I_2 = frac(1,2) cos x sin x + frac(1, 2) underbrace(x, I_0)
  $

  $
    therefore I_6 = frac(1, 6) cos^5 x sin x + frac(5, 6 dot.op 4) cos^3 x sin x + frac(5 dot.op 3 dot.op 1, 6 dot.op 4 dot.op 2) cos x sin x + frac(5 dot.op 3 dot.op 1, 6 dot.op 4 dot.op 2) x + C
  $
]

== Separable ODEs

The next simplest ODEs, where: $ frac(dif y, dif x) = a(x) dot.op b(y) $

where $a(x)$ is *function of x only*, and $b(y)$ is *function of y only*.

Assume that $b(y) != 0$:

$ 
  frac(1, b(y)) frac(dif y, dif x) &= a(x) \
  => integral frac(1, b(y)) dif y &= integral a(x) dif x
$

The final form is two direct integrations that we can solve separately.

#example[
  // we can use display() to use inline math the bigger size
  Find the genearl solution to the separable differential equation ($0 < x < 1$ to avoid continuity issues): $display(x(y^2 - 1) - y(x^2 - 1) frac(dif y, dif x) = 0)$.

  $
    x(y^2 - 1) - y(x^2 - 1) dot.op frac(dif y, dif x) &= 0 \
    y(x^2 - 1) dot.op frac(dif y, dif x) &= -x (y^2 - 1) \
    frac(y, y^2 - 1) dot.op frac(dif y, dif x) &= - frac(x, x^2 - 1) #h(3cm) (arrow.l.long.squiggly) \
    #text(fill:blue)[$underbrace(#text(fill:black)[$integral frac(y, y^2 - 1) dif y$], #text[use absolute to reuse $D$])$] &= #text(fill:red)[$underbrace(#text(fill:black)[$integral frac(x, 1 - x^2) dif x$], "derivative of a log =" D)$] \
  $

  #rect[
    #v(0.5em)
    $D: [ln (1-x^2)]' = frac(-2x, 1-x^2)$
    #v(0.5em)
  ]

  $
    &... \
    frac(1, 2) ln |y^2 - 1| &= -frac(1, 2) ln (1 - x^2) + C \
  $

  Get rid of $log$ by using the property of log ($log a + log b = log a dot.op b$)

  $
    &... \
    frac(1, 2) ln |(y^2 - 1)|(1 - x^2) &= C \
    |(y^2 - 1)|(1 - x^2) &= e^(2C) => cal(C) (> 0)
  $

  Therefore, the answer is $|y^2 - 1|underbrace((1 - x^2), > 0) = cal(C)$ where $cal(C) > 0$.

  We can drop the absolute to drop the assumption of $cal(C)$ > 0 and allow negatives, to get a better looking answer.

  $ (1-y^2)(1-x^2) = cal(C) $ <final-c>

  ...except $cal(C)$ still cannot be 0, because even after allowing negatives, there's still no scenario where $|e^x| = 0$, so it still doesn't look nice. We lost that case in ($arrow.l.long.squiggly$), which requires $y^2 - 1 != 0$, but we need to allow that because $y$ could be $plus.minus 1$ (which is legal).

  $y = plus.minus 1$ is included in the solution if we allow $cal(C) = 0$ in the answer. Hence $cal(C)$ can now be any constants, and @final-c is the final answer.
]