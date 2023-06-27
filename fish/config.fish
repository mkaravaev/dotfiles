if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx ERL_AFLAGS "-kernel shell_history enabled"
set -gx VISUAL "opt/homebrew/bin/nvim"
set -gx EDITOR "opt/homebrew/bin/nvim"

# Enable AWS CLI autocompletion: github.com/aws/aws-cli/issues/1079
complete --command aws --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); aws_completer | sed \'s/ $//\'; end)'

source /opt/homebrew/opt/asdf/libexec/asdf.fish


