zimfw() { source /Users/dlchudnov/.zim/zimfw.zsh "${@}" }
zmodule() { source /Users/dlchudnov/.zim/zimfw.zsh "${@}" }
fpath=(/Users/dlchudnov/.zim/modules/utility/functions /Users/dlchudnov/.zim/modules/duration-info/functions /Users/dlchudnov/.zim/modules/git-info/functions /Users/dlchudnov/.zim/modules/zsh-completions/src ${fpath})
autoload -Uz -- mkcd mkpw duration-info-precmd duration-info-preexec coalesce git-action git-info
source /Users/dlchudnov/.zim/modules/environment/init.zsh
source /Users/dlchudnov/.zim/modules/input/init.zsh
source /Users/dlchudnov/.zim/modules/termtitle/init.zsh
source /Users/dlchudnov/.zim/modules/utility/init.zsh
source /Users/dlchudnov/.zim/modules/duration-info/init.zsh
source /Users/dlchudnov/.zim/modules/asciiship/asciiship.zsh-theme
source /Users/dlchudnov/.zim/modules/completion/init.zsh
source /Users/dlchudnov/.zim/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/dlchudnov/.zim/modules/zsh-history-substring-search/zsh-history-substring-search.zsh
source /Users/dlchudnov/.zim/modules/zsh-autosuggestions/zsh-autosuggestions.zsh
