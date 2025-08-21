# =============================================================================
# ZSH CONFIGURATION
# =============================================================================

# -----------------------------------------------------------------------------
# Completions
# -----------------------------------------------------------------------------
autoload -U compinit
compinit

# -----------------------------------------------------------------------------
# Tools and Utilities
# -----------------------------------------------------------------------------

# z - Directory jumping tool
. /opt/homebrew/etc/profile.d/z.sh

# SwiftPM - Swift Package Manager
export PATH="$HOME/.swiftpm/bin:$PATH"

# direnv - Directory environment variables
eval "$(direnv hook zsh)"

# fzf - Fuzzy finder
source <(fzf --zsh)

# gh - GitHub CLI
eval "$(gh completion -s zsh)"

# -----------------------------------------------------------------------------
# Prompt Configuration
# -----------------------------------------------------------------------------

# Git information in prompt
autoload -Uz vcs_info
precmd() { 
  vcs_info
  # Set terminal title to git project name or current directory
  if [[ -n ${vcs_info_msg_0_} ]]; then
    # In git repository - show project name
    local git_root=$(git rev-parse --show-toplevel 2>/dev/null)
    if [[ -n $git_root ]]; then
      local project_name=$(basename "$git_root")
      print -Pn "\e]0;$project_name\a"
    fi
  else
    # Not in git repository - show current directory
    print -Pn "\e]0;%1~\a"
  fi
}
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '(%b)'

# User display customization
current_user=$(whoami)
current_host=$(hostname)
if [[ "$current_user" == "$USER" && "$current_host" == "$HOST" ]]; then
  user_display="⬥"
else
  user_display="%n@%m"
fi

# Final prompt format
PROMPT='${user_display} %1~ ${vcs_info_msg_0_}: '