vim.keymap.set("n", "<leader>e", function ()
    Snacks.explorer.open(opts)
end, { desc = "Open snacks explorer" })
