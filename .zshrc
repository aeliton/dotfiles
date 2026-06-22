export VIRTUAL_ENV_DISABLE_PROMPT=1

python_venv_status() {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    echo "%B%F{green}(${VIRTUAL_ENV:t})%f%b "
  fi
}

git_dirty_status() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    [[ -n $(git status --porcelain 2>/dev/null) ]] && echo "%F{yellow}✗%f"
  fi
}

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%B%F{blue}git:(%F{red}%b%B%F{blue})%f'

git_prompt_info() {
  if [[ -n "$vcs_info_msg_0_" ]]; then
    local dirty_marker=$(git_dirty_status)
    if [[ -n "$dirty_marker" ]]; then
      echo "${vcs_info_msg_0_} ${dirty_marker}%f%b "
    else
      echo "${vcs_info_msg_0_}%f%b "
    fi
  fi
}

setopt PROMPT_SUBST

PROMPT='$(python_venv_status)%(?:%B%F{green}➜%b :%B%F{red}➜%b ) %B%F{cyan}%1~%f%b $(git_prompt_info)'

export CLICOLOR=1
if [[ "$OSTYPE" == "darwin"* ]]; then
  alias ls='ls -G'
  export LSCOLORS="DxExBxdxbxegedabagacad"
else
  alias ls='ls --color=auto'
  export LS_COLORS="di=01;34:ln=01;36:so=32:pi=33:ex=01;31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
  export LS_COLORS="$LS_COLORS:*.jpg=01;35:*.jpeg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.tiff=01;35"
  export LS_COLORS="$LS_COLORS:*.mp4=01;35:*.mkv=01;35:*.avi=01;35:*.mov=01;35:*.webm=01;35:*.flv=01;35"
  export LS_COLORS="$LS_COLORS:*.zip=01;31:*.tar=01;31:*.gz=01;31:*.rar=01;31:*.7z=01;31"
fi

autoload -Uz compinit && compinit
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

export PATH=$HOME/.local/bin:$PATH

for script in "$HOME/.sh"/*
do
  source ${script}
done

export DOCKER_HOME="${HOME}/.cache/docker"
export LIBVIRT_DEFAULT_URI=qemu:///system
