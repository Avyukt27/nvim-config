local function math()
  return vim.api.nvim_eval 'vimtex#syntax#in_mathzone()' == 1
end

local visualSelectionOrInsert = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, t(parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1))
  end
end

local generate_matrix = function(args, snip)
  local rows = tonumber(snip.captures[2])
  local cols = tonumber(snip.captures[3])
  local nodes = {}
  local ins_indx = 1
  for j = 1, rows do
    table.insert(nodes, r(ins_indx, tostring(j) .. 'x1', i(1)))
    ins_indx = ins_indx + 1
    for k = 2, cols do
      table.insert(nodes, t ' & ')
      table.insert(nodes, r(ins_indx, tostring(j) .. 'x' .. tostring(k), i(1)))
      ins_indx = ins_indx + 1
    end
    table.insert(nodes, t { '\\\\', '' })
  end
  -- fix last node.
  nodes[#nodes] = t '\\\\'
  return sn(nil, nodes)
end

return {
  s({ trig = ';a', snippetType = 'autosnippet', desc = 'alpha', wordTrig = false }, { t '\\alpha' }),
  s({ trig = ';b', snippetType = 'autosnippet', desc = 'alpha', wordTrig = false }, { t '\\beta' }),
  s({ trig = ';g', snippetType = 'autosnippet', desc = 'alpha', wordTrig = false }, { t '\\gamma' }),
  s({ trig = ';i', snippetType = 'autosnippet', desc = 'alpha', wordTrig = false }, { t '\\infty' }),
  s({ trig = ';N', snippetType = 'autosnippet', desc = 'alpha', wordTrig = false }, { t '\\nabla' }),

  s(
    { trig = 'fig', snippetType = 'snippet', dscr = 'A basic figure environment' },
    fmta(
      [[
        \begin{figure}
        \centering
        \includegraphics[width=0.9\linewidth]{<>}
        \caption{
            \textbf{<>}
            <>
        }
        \label{fig:<>}
        \end{figure}

        ]],
      { i(1, 'filename'), i(2, 'captionBold'), i(3, 'captionText'), i(4, 'figureLabel') }
    )
  ),

  s(
    { trig = 'env', snippetType = 'snippet', dscr = 'Begin and end an arbitrary environment' },
    fmta(
      [[
        \begin{<>}
            <>
        \end{<>}
        ]],
      { i(1), i(2), rep(1) }
    )
  ),

  s(
    'textbf',
    f(function(args, snip)
      local res, env = {}, snip.env
      for _, ele in ipairs(env.LS_SELECT_RAW) do
        table.insert(res, '\\textbf{' .. ele .. '}')
      end
      return res
    end, {})
  ),

  s(
    { trig = ';I', snippetType = 'autosnippet', desc = 'integral with infinite or inserted limits', wordTrig = false },
    fmta(
      [[
        <>
        ]],
      {
        c(1, {
          t '\\int_{-\\infty}^\\infty',
          sn(nil, fmta([[ \int_{<>}^{<>} ]], { i(1), i(2) })),
        }),
      }
    )
  ),

  postfix(
    { trig = 'hat', match_pattern = [[[\\%w%.%_%-%"%']+$]], snippetType = 'autosnippet', dscr =
    'postfix hat when in math mode' },
    { l('\\hat{' .. l.POSTFIX_MATCH .. '}') },
    { condition = math }
  ),

  postfix(
    { trig = 'vec', match_pattern = [[[\\%w%.%_%-%"%']+$]], snippetType = 'autosnippet', dscr =
    'postfix vec when in math mode' },
    { l('\\vec{' .. l.POSTFIX_MATCH .. '}') },
    { condition = math }
  ),

  s({ trig = 'emph', dscr = 'the emph command, either in insert mode or wrapping a visual selection' },
    fmta('\\emph{<>}', { d(1, visualSelectionOrInsert) })),

  s(
    {
      trig = '([%sbBpvV])Mat(%d+)x(%d+)',
      snippetType = 'autosnippet',
      regTrig = true,
      wordTrig = false,
      dscr = '[bBpvV]matrix of A x B size',
    },
    fmta(
      [[
    \begin{<>}
    <>
    \end{<>}]],
      {
        f(function(_, snip)
          if snip.captures[1] == ' ' then
            return 'matrix'
          else
            return snip.captures[1] .. 'matrix'
          end
        end),
        d(1, generate_matrix),
        f(function(_, snip)
          return snip.captures[1] .. 'matrix'
        end),
      }
    ),
    { show_condition = math }
  ),
}
