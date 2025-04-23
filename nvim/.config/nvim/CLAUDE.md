# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

- **Format**: `:lua vim.lsp.buf.format()` or use `<leader>cf` keybinding
- **LSP Commands**: Access via `<leader>c` prefix (hover, references, actions, etc.)
- **Testing**: Use `<leader>t` prefix for test operations
- **Debugging**: Access via `<leader>d` prefix for debug operations

## Style Guidelines

- **Indentation**: 4 spaces (tabstop=4, shiftwidth=4, expandtab)
- **Formatting**: Use stylua for Lua formatting (configured in null-ls)
- **Keybindings**: 
  - Always include descriptive `desc` field in `vim.keymap.set`
  - Use leader-based prefix groups (`<leader>c` for LSP, `<leader>t` for tests)
- **Plugin Configuration**: Use lazy.nvim's module approach (one file per plugin/feature)
- **Imports**: Place at the top of the configuration function
- **Consistency**: Follow existing patterns for similar functionality
- **LSP**: Configure via mason and lspconfig for consistent language server setup

## Structure

The config follows a modular approach with plugins organized by functionality in lua/plugins/.

## Accessing Help Files

To access Neovim plugin help files, use:
```bash
nvim --headless -c "help plugin-name" -c 'echom expand("%")' -c 'qall'
```
Then view the returned file path with your preferred tool. For example:
```bash
less /path/to/help/file.txt
```