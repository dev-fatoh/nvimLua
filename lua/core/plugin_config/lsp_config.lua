local nvim_lsp = require("lspconfig")

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      
    })
  end
end

-- TypeScript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = {"javascript","javascriptreact" ,"typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}
--emmet
nvim_lsp.emmet_language_server.setup({
  on_attach=on_attach,
  filetypes={ "astro", "css", "eruby", "html", "htmldjango","javascript", "javascriptreact", "less", "pug", "sass", "scss", "svelte", "typescriptreact", "vue" }
})


