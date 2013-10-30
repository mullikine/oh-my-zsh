#ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[white]%}["
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg_bold[red]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[white]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[yellow]%}δ"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_PROMPT_SUFFIX="%{$fg_bold[red]%}»%{$reset_color%}"

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  if [[ "${PWD}" != "/media/ssh-"* ]]; then
    local cb="$(current_branch)"
    if [ -n "$cb" ]; then
      echo -n "$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
    fi
  fi
  echo "$ZSH_THEME_PROMPT_SUFFIX"
}


PROMPT='$(git_custom_status)%b '
