require 'pronto'

namespace :ns do
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