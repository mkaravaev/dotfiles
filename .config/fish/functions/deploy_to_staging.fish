#Capistraton
function deploy_to_staging
  git checkout staging;
  and git merge --no-ff -m 'Deploy to staging' $argv;
  and git push;
  #and bundle exec cap staging deploy > tmp/deploy_staging.log; not use this becouse of codeship
  and git checkout dev
end
