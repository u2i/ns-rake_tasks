require 'pronto'

namespace :ns do
  Pronto.gem_names.each { |gem_name| require "pronto/#{gem_name}" }

  namespace :pronto do
    desc 'run pronto against unstaged'
    task :local do
      Pronto.run('origin/master', '.')
    end

    desc 'run pronto against branch, eg. origin/master'
    task :branch, [:branch_name] do |_t, args|
      Pronto.run(args[:branch_name], '.')
    end

    desc 'run pronto on PR, provide GITHUB_ACCESS_TOKEN=token PULL_REQUEST_ID=id env variables'
    task :pr do
      formatter = Pronto::Formatter::GithubPullRequestFormatter.new
      Pronto.run('origin/master', '.', formatter)
    end
  end
end