## Working with the Editor

### Understanding Vim

Vim is a modal editor, which means it operates in different modes, each designed for specific tasks.

#### Editor Modes

**Normal Mode**
- Default mode when starting NeoVim
- Used for navigation and executing commands
- Every key is a command in this mode
- Cursor appears as a block
- Enter: Press `Esc` from any other mode

**Insert Mode**
- Mode for typing and editing text
- Works like a regular text editor
- Cursor appears as a vertical line
- Enter: `i` (insert before cursor), `a` (insert after cursor), `o` (new line below)
- Exit: `Esc` to return to Normal Mode

**Visual Mode**
- Mode for selecting text
- Allows selecting blocks of text for operations
- Cursor highlights selected text
- Enter: `v` (character-wise), `V` (line-wise), `Ctrl+v` (block-wise)
- Exit: `Esc` to return to Normal Mode

**Command-line Mode**
- Mode for executing editor commands
- Shows a line at the bottom starting with `:`
- Enter: `:` from Normal Mode
- Exit: `Esc` or `Enter` (to execute command)

### Key Binding Fundamentals

#### Built-in Vim Commands
Vim has numerous built-in commands for navigation, editing, and file management. These commands are the foundation of the editor and work in all vim installations. They typically consist of one or more letters and are executed in Normal Mode.

#### Custom Commands
In addition to built-in commands, you can create custom key combinations to perform complex operations or launch plugins. In our configuration, many commands are set up for convenient work with modern development tools.

#### Leader Key
The Leader key is a special key used as a prefix for custom commands. In our configuration, the Leader key is `Space`. This means many commands start by pressing the spacebar, followed by other keys.

#### Key Combination Syntax
- `<Space>` - spacebar (our Leader key)
- `<C-h>` - Ctrl + h
- `<S-h>` - Shift + h  
- `<M-h>` or `<A-h>` - Alt + h
- `<CR>` - Enter
- `<Esc>` - Escape
- `<Tab>` - Tab
- `gd` - press g, then d
- `[d` - press [, then d

## Basic Vim Commands

### Text Navigation
- `h, j, k, l` - move left, down, up, right (alternative to arrow keys)
- `w` - move to beginning of next word
- `b` - move to beginning of previous word
- `e` - move to end of current word
- `0` - move to beginning of line
- `$` - move to end of line
- `gg` - move to beginning of file
- `G` - move to end of file
- `Ctrl+d` - scroll down half screen
- `Ctrl+u` - scroll up half screen

### Text Editing
- `i` - enter insert mode before cursor
- `a` - enter insert mode after cursor
- `o` - create new line below and enter insert mode
- `O` - create new line above and enter insert mode
- `x` - delete character under cursor
- `dd` - delete entire line
- `yy` - copy entire line
- `p` - paste copied text after cursor
- `P` - paste copied text before cursor

### Search and Replace
- `/text` - search for text in file (forward)
- `?text` - search for text in file (backward)
- `n` - go to next search match
- `N` - go to previous search match
- `*` - search for word under cursor

### File Operations
- `:w` - save file
- `:q` - close file
- `:wq` - save and close file
- `:q!` - close file without saving

### Undo and Redo
- `u` - undo last change
- `Ctrl+r` - redo last undone change

## AI Assistant (Avante.nvim)

Advanced AI-powered coding assistant with Claude Sonnet 4 integration.

- `<Space>aa` - Ask AI a question about your code
- `<Space>ar` - Refresh AI response
- `<Space>ae` - Edit selected text with AI (visual mode)
- `<Space>at` - Toggle AI sidebar panel
- `<Space>af` - Focus on AI window
- `<Space>an` - Create new AI conversation
- `<Space>ah` - Show AI conversation history
- `<Space>aS` - Stop AI text generation
- `<Space>aR` - Display repository structure map
- `<Space>ac` - Add current file to AI context
- `<Space>aB` - Add all open files to AI context
- `<Space>as` - Toggle AI auto-suggestions
- `<Space>a?` - Switch between agentic (act) and legacy (plan) AI modes

## AstroNvim Core Features

Essential AstroNvim functionality for file management and navigation.

- `<Space>e` - Toggle file explorer (Neo-tree)
- `<Space>o` - Toggle code outline view
- `<Space>w` - Save current file
- `<Space>q` - Quit NeoVim
- `<Space>c` - Close current buffer
- `<Space>C` - Force close buffer (without saving)
- `<Space>n` - Create new file
- `<Space>h` - Go to home screen
- `<Space>u` - Toggle URL highlighting

## File Management (Neo-tree)

Advanced file explorer with git integration and file operations.

- `<Space>e` - Toggle file explorer
- `<Space>E` - Focus file explorer
- In Neo-tree window:
  - `a` - Add new file/folder
  - `d` - Delete file/folder
  - `r` - Rename file/folder
  - `c` - Copy file/folder
  - `x` - Cut file/folder
  - `p` - Paste file/folder
  - `R` - Refresh tree
  - `H` - Toggle hidden files
  - `<CR>` - Open file/expand folder

## Search (Telescope)

Powerful fuzzy finder for files, text, and more.

- `<Space>ff` - Find files in project
- `<Space>fw` - Find words (live grep search)
- `<Space>fb` - Find open buffers
- `<Space>fh` - Find help documentation
- `<Space>fc` - Find commands
- `<Space>fk` - Find key mappings
- `<Space>fm` - Find marks
- `<Space>fr` - Find recent files
- `<Space>fo` - Find options
- `<Space>ft` - Find themes
- `<Space>f'` - Find marks
- `<Space>f/` - Find in current buffer

## LSP (Language Server Protocol)

Intelligent code features powered by language servers.

### Navigation
- `gd` - Go to definition
- `gD` - Go to declaration
- `gr` - Go to references
- `gi` - Go to implementation
- `gt` - Go to type definition

### Documentation and Help
- `K` - Show hover documentation
- `<Space>lh` - Show signature help
- `<Space>li` - Show LSP info

### Code Actions
- `<Space>la` - Show code actions
- `<Space>lf` - Format document
- `<Space>lr` - Rename symbol
- `<Space>ls` - Show document symbols

### Diagnostics
- `<Space>ld` - Show line diagnostics
- `<Space>lD` - Show workspace diagnostics
- `[d` - Go to previous diagnostic
- `]d` - Go to next diagnostic

## Terminal Management (ToggleTerm)

Integrated terminal with multiple layouts and specialized terminals.

### Basic Terminal Operations
- `<C-\>` - Toggle floating terminal
- `<Space>tf` - Toggle floating terminal
- `<Space>th` - Toggle horizontal terminal
- `<Space>tv` - Toggle vertical terminal
- `<Space>tn` - Create new terminal

### Specialized Terminals
- `<Space>tl` - Toggle Lazygit (git interface)
- `<Space>tp` - Toggle Node.js REPL
- `<Space>tm` - Toggle NPM terminal
- `<Space>tt` - Toggle terminal with current file's directory

### Terminal Navigation
- `<C-h/j/k/l>` - Navigate between terminal and editor
- `<C-\><C-n>` - Enter normal mode in terminal
- `i` or `a` - Return to terminal mode

## Git Integration

Git workflow tools integrated into the editor.

- `<Space>gg` - Open Lazygit
- `<Space>gl` - Git log
- `<Space>gp` - Git push
- `<Space>gP` - Git pull
- `<Space>gt` - Git status
- `<Space>gb` - Git branches
- `<Space>gc` - Git commits
- `<Space>gC` - Git checkout
- `<Space>gf` - Git fetch
- `<Space>gm` - Git merge

## Buffer and Window Management

Efficient navigation between files and window layouts.

### Buffer Operations
- `<S-h>` - Previous buffer
- `<S-l>` - Next buffer
- `<Space>c` - Close current buffer
- `<Space>C` - Force close buffer
- `<Space>b` - List all buffers

### Window Navigation
- `<C-h>` - Move to left window
- `<C-j>` - Move to window below
- `<C-k>` - Move to window above
- `<C-l>` - Move to right window

### Window Resizing
- `<C-Up>` - Increase window height
- `<C-Down>` - Decrease window height
- `<C-Left>` - Decrease window width
- `<C-Right>` - Increase window width

### Window Management
- `<Space>w` - Save file
- `<Space>|` - Split window vertically
- `<Space>-` - Split window horizontally
- `<Space>wd` - Close window