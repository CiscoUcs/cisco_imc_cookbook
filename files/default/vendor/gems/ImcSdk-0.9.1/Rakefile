require "bundler/gem_tasks"
require "rake/testtask"
#require "rspec/core/rake_task"

#RSpec::Core::RakeTask.new(:spec)

#task :default => :spec

Rake::TestTask.new do |t|
    t.libs << "test"
    t.test_files = FileList["test/**/*_test.rb"]
    t.verbose = false 
end

task default: :test
