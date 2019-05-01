#ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[white]%}["
# ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%K{233}%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%K{234}%F{124}"

#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[white]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "

# ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}%{$fg_bold[yellow]%} %K{233}δ"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}%F{220} %K{234}δ"

# ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[yellow]%}δ"

# ZSH_THEME_GIT_PROMPT_DIRECTORY=" %{$bg[red]%}%{$fg[white]%}"
# ZSH_THEME_GIT_PROMPT_DIRECTORY=" %{$bg[red]%}%F{001}"
ZSH_THEME_GIT_PROMPT_DIRECTORY="%{$reset_color%} %F{124}%K{234}"
# ZSH_THEME_TIME="%{$reset_color%} %F{234}"
# ZSH_THEME_TIME="%{$reset_color%} %K{124}%F{000}"
# ZSH_THEME_TIME="%{$reset_color%} %K{088}%F{000}"
ZSH_THEME_TIME="%{$reset_color%} %F{124}%K{000}%K{234}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
# ZSH_THEME_PROMPT_SUFFIX="%{$fg_bold[red]%}»%{$reset_color%}%K{default}%F{default}"
ZSH_THEME_PROMPT_SUFFIX="%F{124}%K{234}»%{$reset_color%}%K{default}%F{default}"

current_time() {
    date +"%H:%M"
}

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  if [[ "${PWD}" != "/media/ssh-"* ]]; then
    local cb="$(current_branch)"
    if [ -n "$cb" ]; then
      echo -n "$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_TIME$(current_time)$ZSH_THEME_GIT_PROMPT_DIRECTORY$(current_dir)$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
    fi
  fi
  echo "$ZSH_THEME_PROMPT_SUFFIX"
}


PROMPT='$(git_custom_status)%b '
