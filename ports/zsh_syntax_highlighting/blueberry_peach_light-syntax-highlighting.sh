# Blueberry Peach Light Theme (for zsh-syntax-highlighting)
#
# Taken from https://github.com/catppuccin/zsh-syntax-highlighting
# See license at the end of this file.
#
# Paste this files contents inside your ~/.zshrc before you activate zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES

# Main highlighter styling: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
#
## General
### Diffs
### Markup
## Classes
## Comments
ZSH_HIGHLIGHT_STYLES[comment]='fg=#8B6E6E'
## Constants
## Entitites
## Functions/methods
ZSH_HIGHLIGHT_STYLES[alias]='fg=#247500'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#247500'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#247500'
ZSH_HIGHLIGHT_STYLES[function]='fg=#247500'
ZSH_HIGHLIGHT_STYLES[command]='fg=#247500'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#247500,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#9A5518,italic'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#9A5518'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#9A5518'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#6F58A2'
## Keywords
## Built ins
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#247500'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#247500'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#247500'
## Punctuation
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#B43B3E'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#6F6358'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#6F6358'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#6F6358'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#B43B3E'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#B43B3E'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#B43B3E'
## Serializable / Configuration Languages
## Storage
## Strings
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#807000'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#807000'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#807000'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#B43B3E'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#807000'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#B43B3E'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#807000'
## Variables
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#6F6358'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#B43B3E'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#6F6358'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#6F6358'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#6F6358'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#6F6358'
## No category relevant in spec
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#B43B3E'
ZSH_HIGHLIGHT_STYLES[path]='fg=#6F6358,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#B43B3E,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#6F6358,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#B43B3E,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#6F6358'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#6F58A2'
#ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
#ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#B43B3E'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#6F6358'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#6F6358'
ZSH_HIGHLIGHT_STYLES[default]='fg=#6F6358'
ZSH_HIGHLIGHT_STYLES[cursor]='fg=#6F6358'

# MIT License
# 
# Copyright (c) 2021 Catppuccin
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
