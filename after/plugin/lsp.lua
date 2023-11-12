local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.ensure_installed({
	'lua_ls',
	'rust_analyzer',
	'hls',
	'clangd',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Insert}
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
	["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "<leader>lg", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>lf", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<leader>ln", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "<leader>lp", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- lsp server config------------------------------------

--Java
require('lspconfig').jdtls.setup({
  single_file_support = true,
  root_dir = function()
    local dir = vim.fs.dirname(
      vim.fs.find(
        { '.gradlew', '.gitignore', 'mvnw', 'build.grade.kts' },
        { upward = true })[1]
    )
    if dir == nil then
      return vim.fn.getcwd()
    else
      return dir
    end
  end,
  on_attach = function(client, bufnr)
  end
})


--------------------------------------------------


lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

