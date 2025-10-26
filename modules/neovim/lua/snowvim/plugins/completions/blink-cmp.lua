require("lze").load({
	{
		"blink.cmp",
		event = { "DeferredUIEnter" },
		on_require = "blink",
		load = function(name)
			require("lzextras").loaders.multi({
				name,
				"luasnip",
			})
		end,
		after = function(_)
			require("blink.cmp").setup({
				appearance = {
					nerd_font_variant = "normal",
					kind_icons = {
						Text = "",
						Method = "",
						Function = "󰡱",
						Constructor = "",
						Field = "",
						Variable = "",
						Property = "",
						Class = "",
						Interface = "",
						Struct = "",
						Module = "",
						Unit = "",
						Value = "",
						Enum = "",
						EnumMember = "",
						Keyword = "",
						Constant = "󰏿",
						Snippet = "",
						Color = "",
						File = "",
						Reference = "",
						Folder = "",
						Event = "⚡",
						Operator = "󰪚",
						TypeParameter = "󰬛",
						Error = "",
						Warning = "",
						Information = "",
						Hint = "",
					},
				},
				snippets = { preset = "luasnip" },
				keymap = {
					preset = "enter",
					["<Up>"] = { "select_prev", "fallback_to_mappings" },
					["<Down>"] = { "select_next", "fallback_to_mappings" },
					["<Tab>"] = { "snippet_forward", "fallback" },
					["<S-Tab>"] = { "snippet_backward", "fallback" },
				},
				signature = {
					enabled = false,
					window = {
						show_documentation = true,
						border = {
							{ "󰙎", "WarningMsg" },
							"─",
							"╮",
							"│",
							"╯",
							"─",
							"╰",
							"│",
						},
						winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:None",
					},
				},
				cmdline = {
					enabled = false,
				},
				completion = {
					menu = {
						border = {
							{ "󱐋", "WarningMsg" },
							"─",
							"╮",
							"│",
							"╯",
							"─",
							"╰",
							"│",
						},
						scrollbar = false,
						winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:None",
					},
					documentation = {
						auto_show = true,
						window = {
							border = {
								{ "󰙎", "WarningMsg" },
								"─",
								"╮",
								"│",
								"╯",
								"─",
								"╰",
								"│",
							},
							winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:None",
						},
					},
					ghost_text = { enabled = false },
					accept = {
						auto_brackets = {
							enabled = true,
							semantic_token_resolution = { enabled = true },
						},
					},
				},
				sources = {
					default = {
						"snippets",
						"lsp",
						"path",
						"buffer",
					},
					providers = {
						snippets = {
							should_show_items = function(ctx)
								return ctx.trigger.initial_kind ~= "trigger_character"
							end,
						},
					},
				},
			})
		end,
	},
	{
		"friendly-snippets",
		dep_of = { "blink.cmp" },
	},
})
