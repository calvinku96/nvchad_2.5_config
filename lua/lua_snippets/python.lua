return {
  s({ trig = "PYNEW", snippetType = "autosnippet" }, {
    t {
      "#!/usr/bin/env python3",
      "",
      "",
      "def main():",
      "\t",
    },
    i(0, "pass"),
    t {
      "",
      "",
      "",
      'if __name__ == "__main__":',
      "\tmain()",
    },
  }),
}
