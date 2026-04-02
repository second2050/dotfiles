local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip.loaders.from_vscode").lazy_load()

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

-- find more here: https://www.nerdfonts.com/cheat-sheet
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = {
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
		["<C-l>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(entry, vim_item)
			-- Kind icons
			if entry.source.name == "copilot" then
				vim_item.kind = "Copilot"
				vim_item.kind_hl_group = "CmpItemKindCopilot"
			end
			local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			kind.kind = " " .. (strings[1] or "") .. " "
			kind.menu = "    (" .. (strings[2] or "") .. ")"
			--[[
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			vim_item.menu = ({
				luasnip = "[Snippet]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
      --]]
			return vim_item
		end,
	},
	sources = cmp.config.sources({
		{ name = "crates" },
		{ name = "nvim_lsp", keyword_length = 3 },
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lua", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 3 },
		{ name = "path" },
	}, {
		{ name = "buffer", keyword_length = 4 },
	}),
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			--require("clangd_extensions.cmp_scores"),
      cmp.config.compare.locality,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
	window = {
		documentation = cmp.config.window.bordered(),
		completion = {
			--winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
			col_offset = 0,
			side_padding = 0,
		},
	},

	experimental = {
		ghost_text = true,
		native_menu = false,
	},
})

-- Customization for Pmenu
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#45475a", fg = "NONE" })
vim.api.nvim_set_hl(0, "Pmenu", { fg = "#cdd6f4", bg = "#313244" })

vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#cdd6f4", bg = "NONE", italic = true })

vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#1e1e2e", bg = "#f38ba8" })
vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#1e1e2e", bg = "#f38ba8" })
vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#1e1e2e", bg = "#f38ba8" })
vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#1e1e2e", bg = "#f38ba8" })

vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#1e1e2e", bg = "#a6e3a1" })
vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#1e1e2e", bg = "#a6e3a1" })
vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#1e1e2e", bg = "#a6e3a1" })

vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#1e1e2e", bg = "#fab387" })
vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#1e1e2e", bg = "#fab387" })
vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#1e1e2e", bg = "#fab387" })

vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#1e1e2e", bg = "#89dceb" })
vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#1e1e2e", bg = "#89dceb" })
vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#1e1e2e", bg = "#89dceb" })
vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#1e1e2e", bg = "#89dceb" })
vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#1e1e2e", bg = "#89dceb" })

vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#1e1e2e", bg = "#f9e2af" })
vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#1e1e2e", bg = "#f9e2af" })

vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#1e1e2e", bg = "#cba6f7" })
vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#1e1e2e", bg = "#cba6f7" })
vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#1e1e2e", bg = "#cba6f7" })

vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#1e1e2e", bg = "#89dceb" })
vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#1e1e2e", bg = "#89dceb" })

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#1e1e2e", bg = "#cba6f7" })
vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#1e1e2e", bg = "#cba6f7" })
vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#1e1e2e", bg = "#cba6f7" })
vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#cdd6f4", bg = "#89b4fa" })
