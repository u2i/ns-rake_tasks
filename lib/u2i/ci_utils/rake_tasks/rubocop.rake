require 'rubocop'
require 'rubocop/rake_task'

namespace :ci do
  RuboCop::RakeTask.new(:rubocop) do |task|
    task.requires = %w(rubocop/formatter/checkstyle_formatter)
    task.formatters = %w(RuboCop::Formatter::CheckstyleFormatter)
    task.options += %w(--no-color --out=checkstyle.xml)
    task.fail_on_error = false
  end
end
