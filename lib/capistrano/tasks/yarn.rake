namespace :custom do
  desc 'run some rake db task'
  task :run_yarn do
    on roles(:app) do
      within release_path do
       execute "cd ~/LionScoail/current && yarn build && yarn build:css && $HOME/.rbenv/bin/rbenv exec bundle exec rake assets:precompile"
      end
    end
  end
end