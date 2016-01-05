namespace :ns do
  namespace :pronto do
    task :local => '^ci:pronto:local'
    task :branch, [:branch_name] => '^ci:pronto:branch'
    task :pr, [:branch_name] => '^ci:pronto:pr'
  end
end

if defined?(JRUBY_VERSION)
  namespace :ci do
    namespace :pronto do
      task :local do
      end

      task :branch, [:branch_name] do |_t, _args|
      end

      task :pr, [:branch_name] do |_t, _args|
      end
    end
  end
else
  require 'pronto'

  namespace :ci do
    Pronto.gem_names.each { |gem_name| require "pronto/#{gem_name}" }

    namespace :pronto do
      desc 'run pronto against unstaged'
      task :local do
        Pronto.run('HEAD', '.')
      end

      desc 'run pronto against branch, eg. origin/master'
      task :branch, [:branch_name] do |_t, args|
        Pronto.run(args[:branch_name], '.')
      end

      desc 'run pronto on PR, provide base branch as argument and GITHUB_ACCESS_TOKEN=token PULL_REQUEST_ID=id and env variables'
      task :pr, [:branch_name] do |_t, args|
        formatter = Pronto::Formatter::GithubPullRequestFormatter.new
        Pronto.run(args[:branch_name], '.', formatter)
      end
    end
  end
end
