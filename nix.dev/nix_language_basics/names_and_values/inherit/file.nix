## The inherit keyword is used to define attributes in a set with the same name as the variables used in the let block.

let
  a = 1;
  b = 2;

  x = {
    c = 3;
    d = 4;
  };
in
{
  ## It is equivalent to a = a; b = b;
  inherit a b;

  ## You can access the attributes of a set by surrounding its name with parentheses.
  ## It is equivalent to c = x.c; d = x.d;
  inherit (x) c d;

  ## You can also define a whole new set of attributes inside the parenthesis when using inherit.
  ## It is equivalent to e = { e = 5; f = 6; }.e;
  inherit
    ({
      e = 5;
      f = 6;
    })
    e
    ;

}
