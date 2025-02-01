local in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

local environment_snip = function(trig, name)
  return s({ trig = trig, snippetType = "autosnippet" }, {
    t { "\\begin{" .. name .. "}", "" },
    t "\t",
    i(0),
    t { "", "\\end{" .. name .. "}" },
  })
end
local environment_snip_f5 = function(name)
  return environment_snip(name .. "<F5>", name)
end
local section_snip = function(trig, name)
  return s({ trig = trig, snippetType = "autosnippet" }, {
    t("\\" .. name .. "{"),
    i(1, "<+section name+>"),
    t { "}", "" },
    i(0, ""),
  })
end
local command_snip = function(trig, name, desc, suf)
  desc = desc == nil and "" or desc
  suf = suf == nil and "" or suf
  return s({ trig = trig, snippetType = "autosnippet", wordTrig = false }, {
    t(suf .. "\\" .. name .. "{"),
    i(1, "<+" .. desc .. "+>"),
    t { "}" },
    i(0, ""),
  })
end
local bracket_snip = function(trig, prefix, suffix, desc)
  desc = desc == nil and "" or desc
  return s({ trig = trig, snippetType = "autosnippet", wordTrig = false }, {
    t(prefix),
    i(1, desc),
    t(suffix),
    i(0, ""),
  })
end
local math_snip = function(trig, obj)
  return s({ trig = trig, snippetType = "autosnippet", wordTrig = false, condition = in_mathzone }, obj)
end
return {
  environment_snip("EEN", "enumerate"),
  environment_snip("EIT", "itemize"),
  environment_snip("EAL", "align"),
  environment_snip("EAS", "align*"),
  environment_snip("EAR", "array"),
  environment_snip("EEQ", "equation"),
  environment_snip("EES", "equation*"),
  environment_snip("EGG", "gather"),
  environment_snip("EGS", "gather*"),
  environment_snip("FRA", "frame"),
  environment_snip_f5 "enumerate",
  environment_snip_f5 "itemize",
  environment_snip_f5 "align",
  environment_snip_f5 "align*",
  environment_snip_f5 "array",
  environment_snip_f5 "equation",
  environment_snip_f5 "equation*",
  environment_snip_f5 "gather",
  environment_snip_f5 "gather*",
  environment_snip_f5 "frame",
  s({ trig = "ENV", snippetType = "autosnippet" }, {
    t { "\\begin{" },
    i(1, "<+env+>"),
    t { "}", "\t" },
    i(0, ""),
    t { "", "\\end{" },
    f(function(args, parent)
      return args[1][1]
    end, { 1 }),
    t { "}" },
  }),

  section_snip("SSE", "section"),
  section_snip("SSS", "subsection"),
  section_snip("SS2", "subsubsection"),

  command_snip("CIT", "cite", "cite", "~"),
  command_snip("LAB", "label", "label"),
  command_snip("RRR", "ref", "ref", "~"),
  command_snip("FTT", "frametitle", "title"),

  bracket_snip("__", "_{", "}"),
  bracket_snip("^^", "^{", "}"),
  bracket_snip("$$", "$", "$"),
  s({ trig = "==", snippetType = "autosnippet" }, { t "&= " }),
  s({ trig = "~~", snippetType = "autosnippet" }, { t "&\\approx " }),
  s({ trig = "=~", snippetType = "autosnippet" }, { t "&\\approx " }),
  bracket_snip("((", "\\left( ", " \\right)"),
  bracket_snip("[[", "\\left[ ", " \\right]"),
  bracket_snip("{{", "\\left\\{ ", " \\right\\}"),
  bracket_snip("()", "(", ")"),
  bracket_snip("[]", "[", "]"),
  bracket_snip("{}", "{", "}"),
  bracket_snip("`^", "\\hat{", "}"),
  bracket_snip("`_", "\\bar{", "}"),
  bracket_snip("`2", "\\sqrt{", "}"),
  math_snip("`/", { t "\\frac{", i(1, "<++>"), t "}{", i(2, "<++>"), t "}", i(0) }),
  math_snip("`6", { t "\\partial" }),
  math_snip("`8", { t "\\infty" }),
  math_snip("`@", { t "\\circ" }),
  math_snip("`=", { t "\\equiv" }),
  math_snip("`*", { t "\\times" }),
  math_snip("`<", { t "\\le" }),
  math_snip("`>", { t "\\ge" }),

  math_snip("`a", { t "\\alpha" }),
  math_snip("`b", { t "\\beta" }),
  math_snip("`c", { t "\\chi" }),
  math_snip("`d", { t "\\delta" }),
  math_snip("`e", { t "\\varepsilon" }),
  math_snip("`f", { t "\\varphi" }),
  math_snip("`g", { t "\\gamma" }),
  math_snip("`h", { t "\\eta" }),
  math_snip("`i", { t "\\iota" }),
  math_snip("`k", { t "\\kappa" }),
  math_snip("`l", { t "\\lambda" }),
  math_snip("`m", { t "\\mu" }),
  math_snip("`n", { t "\\nu" }),
  math_snip("`o", { t "\\omicron" }),
  math_snip("`p", { t "\\pi" }),
  math_snip("`q", { t "\\theta" }),
  math_snip("`r", { t "\\rho" }),
  math_snip("`s", { t "\\sigma" }),
  math_snip("`t", { t "\\tau" }),
  math_snip("`u", { t "\\upsilon" }),
  math_snip("`v", { t "\\varsigma" }),
  math_snip("`w", { t "\\omaga" }),
  math_snip("`x", { t "\\xi" }),
  math_snip("`y", { t "\\psi" }),
  math_snip("`z", { t "\\zeta" }),
  math_snip("`N", { t "\\Nabla" }),
  math_snip("`T", { t "\\theta" }),
  math_snip("`Y", { t "\\Psi" }),

  bracket_snip("FBF", "\\mathbf{", "}"),
  bracket_snip("CAL", "\\mathcal{", "}"),
  bracket_snip("FEM", "\\emph{", "}"),
}
