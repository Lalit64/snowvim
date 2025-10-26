require("lze").load({
	{
		"plenary.nvim",
	},
	{
		"vim-sleuth",
	},
	{
		"render-markdown.nvim",
	},
	{
		"nvim-autopairs",
		event = { "DeferredUIEnter" },
		after = function(_)
			require("nvim-autopairs").setup({
				check_ts = true,
			})
		end,
	},
	{
		"markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
	},
})
