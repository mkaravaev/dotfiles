function current_branch --wraps='git branch --show-current' --description 'alias current_branch=git branch --show-current'
  git branch --show-current $argv
        
end
