local function config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {"lua", "javascript", "python", "rust", "java", "c"},
    auto_install = true,
    highlight = {
       enable = true,
       additional_vim_regex_highlighting = false
    },
    indent = { enabled = true },
    incremental_selection = { enabled = true },
  })
end


return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = config
}
