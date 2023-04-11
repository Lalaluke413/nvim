local csv = require('csv')

local function setup_completion_source(dict_file)
  local cmp = require('cmp')
  local fzf = require('fzf')
  local matcher = fzf.fuzzy_matcher
  local opts = {
    '--exact',
    '--header-lines=1',
    '--delimiter', ',',
    '--tiebreak', 'begin',
    '--nth', '1',
    '--with-nth', '1',
    '--preview', 'echo {1}',
  }
  local cmd = string.format('tail -n +2 %s', dict_file)
  local function get_completions()
    local lines = {}
    for _, row in ipairs(csv.parse_file(dict_file)) do
      lines[#lines + 1] = string.format('%s\t%s', row[1], row[2])
    end
    return fzf.fzf(lines, table.concat(opts, ' '))
  end
  cmp.register_source('fzf_dict', {
    priority = 500,
    matcher = matcher(opts),
    completion = {
      get_trigger_characters = function() return {} end,
      get_completions = get_completions,
    },
  })
end

local function setup()
  local dict_file = vim.fn.stdpath('config') .. '/dict.csv'
  setup_completion_source(dict_file)
end

return { setup = setup }
