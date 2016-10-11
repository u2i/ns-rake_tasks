namespace :ci do
  namespace :pronto do
    task :load_pronto_plugins do
      Pronto::GemNames.new.to_a.each { |gem_name| require "pronto/#{gem_name}" }
    end

    desc 'run pronto against unstaged'
    task local: :load_pronto_plugins do
      Pronto.run('HEAD', '.')
    end

    desc 'run pronto against branch, eg. origin/master'
    task :branch, [:branch_name] => :load_pronto_plugins do |_t, args|
      Pronto.run(args[:branch_name], '.')
    end

    desc 'run pronto on PR, provide base branch as argument and ' \
         'GITHUB_ACCESS_TOKEN=token and PULL_REQUEST_ID=id as ENV variables'
    task :pr, [:branch_name] => :load_pronto_plugins do |_t, args|
      formatter = Pronto::Formatter::GithubPullRequestFormatter.new
      status_formatter = Pronto::Formatter::GithubStatusFormatter.new
      Pronto.run(args[:branch_name], '.', [formatter, status_formatter])
    end
  end
end
