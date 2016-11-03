#staging
function deploy_topo
  mix edeliver build release --branch=$argv --verbose;
  and mix edeliver deploy release to staging --verbose;
  and mix edeliver restart staging --verbose
end
