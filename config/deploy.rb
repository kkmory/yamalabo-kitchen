# config valid for current version and patch releases of Capistrano
lock "~> 3.11.1"

set :application, "yamalabo-nodes"
set :repo_url, "git@github.com:moririn772/univ-bcnodes.git"
set :pty, true 

# デプロイ先の設定
set :deploy_to, "/usr/yamalabo/src"
role :test_btc, ENV['YAMALABO_UBUNTU_HOSTS'].split(",")
role :test_host, "localhost"

set :ssh_options, {
  user: ENV['YAMALABO_UBUNTU_USER'],
  password: ENV['YAMALABO_UBUNTU_PASS'],
  auth_methods: %w(password),
  forward_agent: false,
}

desc "デプロイ"
task :deploy do 
  on roles(:nuc) do
    deploy_to = fetch :nuc
    execute "echo complete deploy!!!!"
  end
end

desc "テスト"
task :test do
  on roles(:test_host) do
    execute "pwd"
  end
end
