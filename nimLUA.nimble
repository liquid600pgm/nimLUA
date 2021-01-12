packageName   = "nimLUA"
version       = "0.3.8"
author        = "Andri Lim"
description   = "glue code generator to bind Nim and Lua together using Nim's powerful macro"
license       = "MIT"
skipDirs      = @["test", "scripts"]

requires: "nim >= 0.18.1"

task test, "Run all tests":
  exec "nim c -r -d:nimDebugDlOpen test/test"
  exec "nim c -r -d:nimDebugDlOpen -d:release test/test"
  exec "nim c -r -d:importLogging test/bug19"
  exec "nim c -r -d:importLogging -d:release test/bug19"

task test32, "Run 32Bit test":
  exec "nim c -r --cpu:i386 --passL:-m32 --passC:-m32 test/test"
  exec "nim c -r -d:release --cpu:i386 --passL:-m32 --passC:-m32 test/test"
