local utils = require("helm.utils")
-- local lspconfig = require("lspconfig")
-- local lsp_configs = require("lspconfig.configs")
-- local lsp_utils = require("lspconfig.util")

local M = {}

function M.setup()

	vim.filetype.add({
		extension = {
			yaml = utils.yaml_filetype,
			yml = utils.yaml_filetype,
            tmpl = utils.tmpl_filetype,
            tpl = utils.tpl_filetype
		},
        filename = {
            ["Chart.yaml"] = "yaml",
            ["Chart.lock"] = "yaml",
        }
	})


    local events = { "BufNewFile", "BufRead" }

    local au_helm = vim.api.nvim_create_augroup("Helm", {})

    vim.api.nvim_create_autocmd(events, {
        pattern = "helm*",
        group = au_helm,
        command = "setlocal commentstring={{/*\\ %s\\ */}}",
    })

	-- if not configs.helm_ls then
	-- 	lsp_configs.helm_ls = {
	-- 		default_config = {
	-- 			capabilities = vim.lsp.protocol.make_client_capabilities(),
	-- 			cmd = { "/workspace/helm/helm-ls/helm-ls-dev.sh", "serve" },
	-- 			filetypes = { "helm", "helm.yaml", "helm.tmpl" },
	-- 			root_dir = function(fname)
	-- 				return lsp_utils.root_pattern("Chart.yaml")(fname)
	-- 			end,
	-- 		},
	-- 	}
	-- end

	-- lspconfig.helm_ls.setup({})
end

-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.gotmpl = {
--     install_info = {
--         -- url = "https://github.com/ngalaiko/tree-sitter-go-template",
--         url = "https://github.com/msvechla/tree-sitter-go-template",
--         branch = "fix_brackets",
--         files = { "src/parser.c" },
--     },
--     filetype = "helm",
--     used_by = { "helm.yaml", "helm.tmpl" },
-- }

return M
