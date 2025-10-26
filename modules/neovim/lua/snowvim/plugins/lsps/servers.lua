local servers = {}

servers.lua_ls = {
	filetypes = { "lua" },
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			formatters = { ignoreComments = true },
			signatureHelp = { enabled = true },
			diagnostics = {
				globals = { "nixCats", "vim" },
				disable = { "missing-fields" },
			},
			telemetry = { enabled = false },
		},
	},
}

servers.basedpyright = {
	settings = {
		basedpyright = {
			analysis = { typeCheckingMode = "standard" },
		},
	},
}

servers.nixd = {
	filetypes = { "nix" },
	settings = {
		nixd = {
			nixpkgs = { expr = "import <nixpkgs> {}" },
			options = {
				darwin = {
					expr = '(builtins.getFlake "github:lalit64/snowflake").darwinConfigurations.lalits-mbp.options',
				},
				home_manager = {
					expr = '(builtins.getFlake "github:lalit64/snowflake").homeConfigurations."lalit@lalits-mbp".options',
				},
			},
		},
	},
}

servers.gopls = {}

servers.astro = {}

servers.bashls = {}

servers.dockerls = {}

servers.jsonls = {}

servers.harper_ls = {
	filetypes = { "markdown", "gitcommit", "typst", "html", "text" },
}

servers.ltex_plus = {
	filetypes = {
		"bib",
		"org",
		"plaintex",
		"rst",
		"rnoweb",
		"tex",
		"pandoc",
		"quarto",
		"rmd",
		"context",
	},
	settings = {
		check_frequency = "save",
	},
}

servers.texlab = {}

servers.marksman = {}

servers.ts_ls = {}

servers.rust_analyzer = {}

servers.svelte = {}

servers.tailwindcss = {}

servers.cssls = {}

servers.html = {}

return servers
