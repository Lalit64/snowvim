require("lze").load({
	{
		"which-key.nvim",
		event = { "DeferredUIEnter" },
		after = function(_)
			require("which-key").setup({
				preset = "modern",
				icons = {
					mappings = false,
				},
				spec = {
					{ "<leader>f", group = "[F]ind" },
					{ "<leader>c", group = "[C]ode" },
					{ "<leader>l", group = "[L]azy" },
					{ "<leader>r", group = "[R]e..." },
				},
			})
		end,
	},
})
