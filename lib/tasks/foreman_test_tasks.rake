# Tasks
namespace :foreman_test do
  namespace :example do
    desc 'Example Task'
    task task: :environment do
      # Task goes here
    end
  end
end

# Tests
namespace :test do
  desc 'Test ForemanTest'
  Rake::TestTask.new(:foreman_test) do |t|
    test_dir = File.join(File.dirname(__FILE__), '../..', 'test')
    t.libs << ['test', test_dir]
    t.pattern = "#{test_dir}/**/*_test.rb"
    t.verbose = true
  end
end

namespace :foreman_test do
  task :rubocop do
    begin
      require 'rubocop/rake_task'
      RuboCop::RakeTask.new(:rubocop_foreman_test) do |task|
        task.patterns = ["#{ForemanTest::Engine.root}/app/**/*.rb",
                         "#{ForemanTest::Engine.root}/lib/**/*.rb",
                         "#{ForemanTest::Engine.root}/test/**/*.rb"]
      end
    rescue
      puts 'Rubocop not loaded.'
    end

    Rake::Task['rubocop_foreman_test'].invoke
  end
end

Rake::Task[:test].enhance do
  Rake::Task['test:foreman_test'].invoke
end

load 'tasks/jenkins.rake'
if Rake::Task.task_defined?(:'jenkins:unit')
  Rake::Task['jenkins:unit'].enhance do
    Rake::Task['test:foreman_test'].invoke
    Rake::Task['foreman_test:rubocop'].invoke
  end
end
