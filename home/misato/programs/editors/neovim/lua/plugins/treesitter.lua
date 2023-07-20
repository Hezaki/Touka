local present, treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
  return
end

treesitter.setup {
  ensure_installed = { "python", "lua", "nix", "java", "css", "html" },
  highlight = {
    enable = true,
    use_languagetree = true
  },
  indent = true,
}
