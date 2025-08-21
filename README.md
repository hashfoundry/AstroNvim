# AstroNvim Configuration

Complete AstroNvim configuration, optimized for Node.js development.

## Features

- 🚀 **AstroNvim Base** - Feature-rich NeoVim distribution
- 🔧 **LSP Support** - TypeScript, JavaScript, JSON, HTML, CSS via Mason
- 📝 **Enhanced Autocompletion** - Advanced completion with AI suggestions
- 🌳 **Syntax Highlighting** - Treesitter with enhanced support
- 📁 **File Management** - Neo-tree file explorer
- 🔍 **Advanced Search** - Telescope with live grep
- 🔀 **Git Integration** - Comprehensive git workflow tools
- 📊 **Modern UI** - AstroUI with customizable themes
- 🖥️ **Terminal Management** - ToggleTerm with Node.js REPL
- 📦 **Node.js Tools** - Package management and TypeScript support

## Requirements

- Ubuntu 24.04 LTS (or compatible system)
- Git
- Node.js LTS
- Rust (for compiling avante.nvim)
- OpenRouter API key (optional, for AI features)

## Project Structure

```
├── .gitignore                   # Git ignore patterns
├── install.sh                  # Automated installation script
├── README.md                   # Project documentation
└── config/
    └── nvim/
        ├── .neoconf.json       # Project configuration
        ├── init.lua            # AstroNvim bootstrap
        └── lua/
            ├── config/
            │   └── lazy.lua    # AstroNvim and plugin configuration
            └── plugins/
                ├── avante.lua      # AI assistant configuration
                ├── nodejs.lua      # Node.js development tools
                └── terminal.lua    # Terminal management
```

## Getting Started

### 1. Clone Repository

```bash
git clone https://github.com/hashfoundry/AstroNvim.git ~/neovim-config
cd ~/neovim-config
```

### 2. Set Up API Key

```bash
echo 'export OPENROUTER_API_KEY="your_openrouter_api_key"' >> ~/.bashrc
source ~/.bashrc
```
**Replace `your_openrouter_api_key` with your actual OpenRouter API key for AI features!**

## Quick Installation

### 1. Run Installation Script

```bash
chmod +x install.sh
./install.sh
```

### 2. First Launch

```bash
nvim
```
Plugins will install automatically on first launch.

## Manual Installation

### Step 1: Update System

```bash
sudo apt update && sudo apt upgrade -y
```

### Step 2: Install Dependencies

```bash
sudo apt install -y curl wget git build-essential unzip software-properties-common
```

### Step 3: Install Node.js

```bash
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
```

### Step 4: Install NeoVim

```bash
wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo tar -xzf nvim-linux-x86_64.tar.gz -C /opt/
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
```

### Step 5: Install Rust (required for avante.nvim)

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source ~/.cargo/env
```

### Step 6: Install LSP Servers

```bash
npm install -g typescript-language-server @vtsls/language-server eslint_d prettier
```

### Step 7: Copy Configuration

```bash
cp -r config ~/.config
```

### Step 8: First Launch

```bash
nvim
```
Plugins will install automatically on first launch.

## Usage

### AI Assistant Features
- **Code Analysis**: Ask questions about your code structure and logic
- **Code Generation**: Generate code snippets, functions, and entire modules
- **Debugging Help**: Get assistance with troubleshooting and error resolution
- **Code Review**: Receive suggestions for code improvements and best practices
- **Documentation**: Generate comprehensive documentation for your code

### Development Workflow
1. Open NeoVim in your project directory: `nvim .`
2. Use `<Space>e` to browse project files
3. Use `<Space>ff` to quickly find and open files
4. Use `<Space>aa` to ask AI for coding assistance
5. Use LSP features (`gd`, `gr`, `K`) for code navigation and documentation
6. Use `<Space>tf` to open terminal for running commands
7. Use `<Space>gg` for git operations
