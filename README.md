### DOTFILES
----
contains:
* bash_profil
* bashrc
* tmux.conf
* vimrc
* Brewfile
* setup

### Installation
1. copy your ssh private key to new machine
2. add key to keychain with `ssh-add ~/.ssh/id_rsa`
3. clone dotfiles into ~/dotfiles
4. run ~/dotfiles/setup
5. Make some manual adjustments such as:
 5.1 iTerm2 add color gruvbox schema `https://github.com/herrbischoff/iterm2-gruvbox`
 5.2 Start tmux at iTerm start add `tmux attach -t base || tmux new -s base` under Preferences/Profiles/General/send text at start
 5.2 iTerm2 change cursor setting to now override with vim settings: Disable Preferences/Profiles/Colors/smart box cursor color
