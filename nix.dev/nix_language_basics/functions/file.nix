## Functions are blocks of code that can be evaluated at call time.
## They can take exactly one argument and return exactly one value.

let

  ## We are defining a set of functions to be used later.
  ## Functions by themselves are anonymous, so they need to be assigned to an identifier.
  functions = {

    ## The argument is defined in the left side of a colon.
    ## The body of the function is defined in the right side of the colon.
    a = (x: x + 1);

    ## An argument may be a set of attributes. If so, you can access them by name.
    b = (x: x.a + 1);

    ## More arguments can be passed by nesting functions.
    c = (x: (y: x + y));

    ## Also, the argument can be a set.
    d = ({ x, y }: x + y);

    ## By using a set, you can define default arguments.
    e = (
      {
        x,
        y ? 0,
      }:
      x + y
    );

    ## Or even accept an arbitrary number of arguments.
    f = ({ x, ... }: x);

    ## You can name an attribute set passed as an argument. So you can access its attributes.
    g = ({ x, y, ... }@args: x + y + args.z);

  };

in

## In order to return multiple functions' results, they need to be put into a set.
rec {
  ## In order to call a function, you need to pass an argument after its identifier.
  a = functions.a 1;

  ## If the argument is a set, you can pass it as a whole.
  b = functions.b {
    a = 1;
  };

  ## On nested functions, you can pass only one argument, so the return will be the inner function with the argument passed.
  c_lambda = functions.c 1;

  ## Than you can pass the second argument. In this case, the order is important.
  c = c_lambda 2;

  ## You can also pass a set as an argument.
  d = functions.d {
    x = 1;
    y = 2;
  };

  ## If you don't pass an argument, the default value will be used.
  e = functions.e {
    x = 1;
  };

  ## You can pass as many arguments as you want. The function, however might not use all of them.
  f = functions.f {
    x = 1;
    y = 2;
  };

  # Sometimes a function will access an attribute that is not defined in the argument set.
  g = functions.g {
    x = 1;
    y = 2;
    z = 3;
  };
}
