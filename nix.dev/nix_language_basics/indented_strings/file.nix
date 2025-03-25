## Strings can be expressed on a block of text, which will preserve the indentation among the lines.
## You can open the block with '' ... ''
## Each line will be trimmed on equal amount of spaces. Therefore, the whitespace before the line most to the left will be ignored for all lines.

let
  ## You can use string interpolation to include variables in the block of text.
  hello = "Hello, Nix!";
in

''
  This is a block of text.
    ${hello}
    It will preserve the indentation.
      Even if you add more levels of indentation.
    The whitespace before the line most to the left will be ignored.
''
