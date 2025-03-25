## let ... in ... allows you to define variables in a block and use them afterwards.
## The variables defined in the let block can be used to define other variables in the same block.
## The order of the variables does not matter.

let
  b = a + 1;
  a = 1;
  c = b + a;
in

[
  a
  b
  c
]
