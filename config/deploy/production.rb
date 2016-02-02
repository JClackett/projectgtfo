set :stage, :production

server '82.196.0.174', user: 'deploy', roles: %w{web app}
