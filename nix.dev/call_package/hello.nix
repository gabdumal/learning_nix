## This expression will create a shell script that prints "Hello, ${audience}!".

{
  writeShellScriptBin,
  audience ? "world",
}:
writeShellScriptBin "hello" ''
  echo "Hello, ${audience}!"
''
