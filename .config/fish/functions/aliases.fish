#Aliases
#alias deploy.production "git checkout master; and git merge --no-ff -m 'Deploy to production' staging; and git push; and bundle exec cap production deploy > tmp/deploy_production.log; and git checkout dev"
alias deploy.production "git checkout master; and git merge --no-ff -m 'Deploy to production' staging; and git push; and git checkout dev"

#Rspec
alias rspec.fast "rspec spec --exclude-pattern '**/features/**/*.rb'"
alias rspec.all "rspec.fast; rspec spec/features" 
#self
alias alias.options "vim ~/.config/fish/functions/aliases.fish"
alias fish_functions "cd ~/.config/fish/functions/"
