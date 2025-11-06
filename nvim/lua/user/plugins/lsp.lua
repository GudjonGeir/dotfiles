-- LSP Configuration & Plugins
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Automatically install LSPs and related tools to stdpath for Neovim
		{ "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Useful status updates for LSP.
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{ "j-hui/fidget.nvim", opts = {} },

		-- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
		-- used for completion, annotations and signatures of Neovim apis
		{ "folke/neodev.nvim", opts = {} },

		-- Allows extra capabilities provided by blink.cmp
		"saghen/blink.cmp",
	},
	config = function()
		-- Create the highlight autogroup once at the top level
		local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = true })

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				-- goto bindings
				map("<localleader>gg", vim.lsp.buf.definition, "Goto definition")
				map("<localleader>gr", require("telescope.builtin").lsp_references, "Goto references")
				map("<localleader>gR", vim.lsp.buf.references, "Open reference list")
				map("<localleader>gi", require("telescope.builtin").lsp_implementations, "Goto implementation")
				map("<localleader>gI", vim.lsp.buf.implementation, "Open implementation list")
				map("<localleader>gD", require("telescope.builtin").lsp_type_definitions, "Type Definition")

				-- help and info bindings
				map("<localleader>hh", vim.lsp.buf.hover, "Hover Documentation")
				map("<localleader>hs", vim.lsp.buf.signature_help, "Signature Documentation")
				vim.keymap.set(
					{ "n", "i" },
					"<C-s>",
					vim.lsp.buf.signature_help,
					{ desc = "Signature Documentation", buffer = event.buf }
				)

				map("<localleader>sd", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
				map("<localleader>sw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")

				-- refactor bindings
				map("<localleader>rr", vim.lsp.buf.rename, "Rename")
				-- buf_map('<localleader>ro', ":LspOrganize<CR>", "")

				map("<localleader>dp", vim.diagnostic.goto_prev, "Go to previous diagnostic message")
				map("<localleader>dn", vim.diagnostic.goto_next, "Go to next diagnostic message")
				map("<localleader>dl", vim.diagnostic.open_float, "Diagnostic Line")
				map("<localleader>dL", vim.diagnostic.setloclist, "Open diagnostic Quickfix list")
				-- map('<localleader>dd', ':TroubleToggle<cr>', "")

				map("<localleader>a", vim.lsp.buf.code_action, "Code action")

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				--    See `:help CursorHold` for information about when this is executed
				--
				-- When you move your cursor, the highlights will be cleared (the second autocommand).
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})
				end

				-- The following autocommand is used to enable inlay hints in your
				-- code, if the language server you are using supports them
				--
				-- This may be unwanted, since they displace some of your code
				if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})

		vim.api.nvim_create_autocmd("LspDetach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
			callback = function(event)
				vim.lsp.buf.clear_references()
				vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event.buf })
			end,
		})

		-- LSP servers and clients are able to communicate to each other what features they support.
		--  By default, Neovim doesn't support everything that is in the LSP specification.
		--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
		--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		local blinkCapabilities = require("blink.cmp").get_lsp_capabilities()

		capabilities = vim.tbl_deep_extend("force", capabilities, blinkCapabilities or {})

		-- Enable the following language servers
		--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
		--
		--  Add any additional override configuration in the following tables. Available keys are:
		--  - cmd (table): Override the default command used to start the server
		--  - filetypes (table): Override the default list of associated filetypes for the server
		--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
		--  - settings (table): Override the default settings passed when initializing the server.
		--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
		local servers = {
			gopls = {},
			ts_ls = {
				root_dir = require("lspconfig").util.root_pattern(
					"nx.json",
					"tsconfig.json",
					"package.json",
					"jsconfig.json",
					".git"
				),
				cmd = { "typescript-language-server", "--stdio", "--verbose" },
				settings = {
					typescript = {
						-- This is the default, but you can change it to `true` if you want
						--  to enable automatic type acquisition for TypeScript
						disableAutomaticTypeAcquisition = false,
						suggest = {
							autoImports = true,
							completeFunctionCalls = true,
							includeCompletionsForModuleExports = true,
							includeCompletionsWithInsertText = true,
						},
					},
					preferences = {
						importModuleSpecifierPreference = "project-relative",
						importModuleSpecifierEnding = "minimal",
					},
				},
				capabilities = {
					documentFormattingProvider = false,
					documentRangeFormattingProvider = false,
				},
			},
			jsonnet_ls = {},
			tailwindcss = {},
			--

			lua_ls = {
				-- cmd = {...},
				-- filetypes = { ...},
				-- capabilities = {},
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
						-- diagnostics = { disable = { 'missing-fields' } },
					},
				},
			},
		}

		-- Ensure the servers and tools above are installed
		--  To check the current status of installed tools and/or manually install
		--  other tools, you can run
		--    :Mason
		--
		--  You can press `g?` for help in this menu.
		require("mason").setup()

		-- You can add other tools here that you want Mason to install
		-- for you, so that they are available from within Neovim.
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Used to format Lua code
			"prettierd",
			"eslint_d",
			"golangci-lint",
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			automatic_enable = true,
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					-- 		-- This handles overriding only values explicitly passed
					-- 		-- by the server configuration above. Useful when disabling
					-- 		-- certain features of an LSP (for example, turning off formatting for tsserver)
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
