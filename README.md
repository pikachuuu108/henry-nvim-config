# My personal modern NeoVim config

## Setup
0. Use the latest version of NVIM (v0.9+)
1. This setup uses `lazy.nvim` plugin manager:
```
git clone https://github.com/pikachuuu108/henry-nvim-config.git ~/.config/nvim
```
2. Start `nvim` - plugins will auto-install
3. **Language Servers**:
   - Configuration: `lua/configs/lsp.lua`
   - Install required LSP servers (e.g., `:LspInstall`)
4. **Treesitter Parsers**:
   - `:TSInstall <language>` to install
   - Configuration: `lua/configs/treesitter.lua`

## Environment
- Python: Anaconda environment setup in `python_env.sh`
```shell
let g:python3_host_prog="/Users/henry/anaconda3/bin/python"
```

## Key Features
1. **Plugin Manager**: Lazy.nvim with `lazy-lock.json`
2. **Language Support**: 
   - LSP configuration via `lsp.lua`
   - Auto-completion via `nvim-cmp.lua`
3. **UI Components**: 
   - Bufferline (`bufferline.lua`)
   - Status line (`statusline.lua`)
   - Filetree (`filetree.lua`)
4. **Developer Tools**:
   - Git integration (`git.lua`)
   - TODO comments (`todo-comments.lua`)
   - Outline/symbols (`outlinetree.lua`)

## Key Mappings
- **Leader**: `<space>` (set in `init.vim`)
- See `lua/core/keymaps.lua` for complete mapping reference

## License
MIT

