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
    i(0, "<++>"),
  })
end
local command_snip = function(trig, name, desc, suf)
  desc = desc == nil and "" or desc
  suf = suf == nil and "" or suf
  return s({ trig = trig, snippetType = "autosnippet", wordTrig = false }, {
    t(suf .. "\\" .. name .. "{"),
    i(1, "<+" .. desc .. "+>"),
    t { "}" },
    i(0, "<++>"),
  })
end
local math_command_snip = function(trig, name, desc, suf)
  desc = desc == nil and "" or desc
  suf = suf == nil and "" or suf
  return s({ trig = trig, snippetType = "autosnippet", wordTrig = false, condition = in_mathzone }, {
    t(suf .. "\\" .. name .. "{"),
    i(1, "<+" .. desc .. "+>"),
    t { "}" },
    i(0, "<++>"),
  })
end
local bracket_snip = function(trig, prefix, suffix, desc)
  desc = desc == nil and "" or desc
  return s({ trig = trig, snippetType = "autosnippet", wordTrig = false }, {
    t(prefix),
    i(1, "<+" .. desc .. "+>"),
    t(suffix),
    i(0, "<++>"),
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
  environment_snip("ELL", "aligned"),
  environment_snip("EAR", "array"),
  environment_snip("EEQ", "equation"),
  environment_snip("EES", "equation*"),
  environment_snip("EGG", "gather"),
  environment_snip("EGS", "gather*"),
  environment_snip("EGA", "gathered"),
  environment_snip("FRA", "frame"),
  environment_snip_f5 "enumerate",
  environment_snip_f5 "itemize",
  environment_snip_f5 "align",
  environment_snip_f5 "align*",
  environment_snip_f5 "aligned",
  environment_snip_f5 "array",
  environment_snip_f5 "equation",
  environment_snip_f5 "equation*",
  environment_snip_f5 "gather",
  environment_snip_f5 "gather*",
  environment_snip_f5 "gathered",
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
  math_snip("`/", { t "\\frac{", i(1, "<++>"), t "}{", i(2, "<++>"), t "}", i(0, "<++>") }),

  bracket_snip("FBF", "\\mathbf{", "}"),
  bracket_snip("FBB", "\\mathbb{", "}"),
  bracket_snip("CAL", "\\mathcal{", "}"),
  bracket_snip("FEM", "\\emph{", "}"),

  math_command_snip("KET", "ket", "ket"),
  math_command_snip("BRA", "bra", "bra"),
  math_command_snip("OPR", "operatorname", "operatorname"),
}
