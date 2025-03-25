## with ... ; ... allows you to access attributes of a set without having to prefix them with the set name.
## You can use other variables in the with block, as long as their names are not the same as the attributes of the set.

let
  a = {
    x = 1;
    y = 2;
    z = 3;
  };

  b = 4;
in

with a;
[
  x
  y
  z
  b
]
