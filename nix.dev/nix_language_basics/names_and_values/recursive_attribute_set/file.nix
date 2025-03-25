## Recursive attribute sets allow to use inner attributes in the definition of other attributes.
## The order of the attributes does not matter.

rec {
  one = 1;
  two = one + 1;
  three = two + 1;
  four = two + two;
  five = four + one;
}
