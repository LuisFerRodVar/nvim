return {
	cmd = { "pylsp" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "setup.py", ".git" },
	settings = {
		pylsp = {
			plugins = {
				pylsp_mypy = { enabled = true },
				pyflakes = { enabled = true },
				flake8 = { enabled = false },
			},
		},
	},
}
