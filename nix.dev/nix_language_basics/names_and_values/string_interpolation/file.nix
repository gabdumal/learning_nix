## String interpolation is done with ${...}.
## The expression inside the curly braces is evaluated and the result is inserted into the string.

let
  a = "1";
  b = 1;
  c = "hi!";
in
## In order to return multiple strings, they need to be put into a list.
[
  ## The result is "a = 1".
  "a = ${a}"

  ## Variables which are not strings need to be converted to strings before they can be interpolated.
  ## The result is "b = 1".
  "b = ${toString b}"

  ## Interpolated expressions can be nested
  ## The result is "c = hi! hi! hi!"
  "c = ${c + " ${c + " ${c}"}"}"
]
