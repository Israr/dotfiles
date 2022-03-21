--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
lvim.lint_on_save = true
lvim.colorscheme = "tokyonight"
-- Enable DAP. Install adapters with DIInstall/DIUnistall. List with DIList
lvim.builtin.dap.active = true


-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<leader>o"] = ":Telescope file_browser<cr>"
lvim.keys.normal_mode["<leader>B"] = ":Telescope buffers<cr>"
lvim.keys.normal_mode["<leader>r"] = ":e ~/roku/roku.sh<cr>"
lvim.keys.normal_mode["<tab>"] = ":BufferLineCycleNext<cr>"
lvim.keys.normal_mode["<S-tab>"] = ":BufferLineCyclePrev<cr>"
lvim.keys.normal_mode["<leader>n"] = ":nohlsearch<CR>"
lvim.keys.normal_mode["<leader>j"] = ":HopWord<CR>"
lvim.keys.normal_mode["<leader>k"] = ":HopChar1<CR>"
lvim.keys.normal_mode["<leader>lg"] = ":lua Lazygit()<CR>"
lvim.keys.normal_mode["<leader>dxc"] = ":lua require\"telescope\".extensions.dap.commands{}<CR>"
lvim.keys.normal_mode["<leader>dxo"] = ":lua require\"telescope\".extensions.dap.configurations{}<CR>"
lvim.keys.normal_mode["<leader>dxv"] = ":lua require\"telescope\".extensions.dap.variables{}<CR>"
--lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>
lvim.keys.normal_mode["<leader>dxf"] = ":lua require\"telescope\".extensions.dap.frames{}<CR>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
lvim.keys.normal_mode["<C-l>"] = false
-- lvim.keys.normal_mode["<C-L>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
lvim.builtin.telescope.on_config_done = function()
    local actions = require "telescope.actions"
    -- for input mode
    lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
    lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
    lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
    lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
    -- for normal mode
    lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
    lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
end

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
-- lvim.builtin.dashboard.active = true
lvim.builtin.alpha.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--     args = {}
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--     args = {}
--   }
-- }

-- Additional Plugins
lvim.plugins = {
    { "folke/tokyonight.nvim" },
    { "ray-x/lsp_signature.nvim",
      config = function() require "lsp_signature".on_attach() end,
      event = "InsertEnter"
    },
    -- { "github/copilot.vim" },
    {
        'phaazon/hop.nvim',
        branch = 'v1.3', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
            -- vim.api.nvim_set_keymap("n", "<leader>s", ":HopChar2<cr>", { silent = true })
            -- vim.api.nvim_set_keymap("n", "<leader>S", ":HopWord<cr>", { silent = true })
        end
    },
    { 'nvim-telescope/telescope-dap.nvim' },
    {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
   { "BufReadPost", "*", "set rnu| g '\"" },
}

function Hello()
    -- vim.inspect(lvim.builtin.gitsigns)
    -- '<C-t>'  toggle term
    print("hello from ikhan")
end

function Lazygit()
    local Terminal  = require('toggleterm.terminal').Terminal
    local lazygit   = Terminal:new({ cmd = "lazygit", hidden = true })
    lazygit:toggle()
end

-- vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua Lazygit_toggle()<CR>", {noremap = true, silent = true})


-- DAP
local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = '/home/ikhan/anaconda3/bin/python';
  args = { '-m', 'debugpy.adapter' };
}
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

-- DAP Setup
function DAPSetup()
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup({
          icons = { expanded = "▾", collapsed = "▸" },
          mappings = {
            -- Use a table to apply multiple mappings
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            edit = "e",
            repl = "r",
            toggle = "t",
          },
          sidebar = {
            -- You can change the order of elements in the sidebar
            elements = {
              -- Provide as ID strings or tables with "id" and "size" keys
              {
                id = "scopes",
                size = 0.25, -- Can be float or integer > 1
              },
              { id = "breakpoints", size = 0.25 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 00.25 },
            },
            size = 40,
            position = "left", -- Can be "left", "right", "top", "bottom"
          },
          tray = {
            elements = { "repl" },
            size = 10,
            position = "bottom", -- Can be "left", "right", "top", "bottom"
          },
          floating = {
            max_height = nil, -- These can be integers or a float between 0 and 1.
            max_width = nil, -- Floats will be treated as percentage of your screen.
            border = "single", -- Border style. Can be "single", "double" or "rounded"
            mappings = {
              close = { "q", "<Esc>" },
            },
          },
          windows = { indent = 1 },
        })
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
-- dapui.open()
end
function DAPClose()
   require("dapui").close()
end
DAPSetup()

-- Tricks
-- Generate list of all config options
-- lvim --headless +'lua require("lvim.utils").generate_settings()' +qa && sort -o lv-settings.lua{,}

