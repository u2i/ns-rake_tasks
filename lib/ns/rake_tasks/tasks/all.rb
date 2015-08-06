unless RUBY_PLATFORM == 'java'
  load 'ns/rake_tasks/tasks/pronto.rake'
end
load 'ns/rake_tasks/tasks/rspec.rake'
load 'ns/rake_tasks/tasks/rubocop.rake'
