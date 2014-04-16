require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/**_test.rb']
end

desc 'Run tests'
task :default => :test

task :console do
  require 'irb'
  require 'irb/completion'
  ARGV.clear
  IRB.start
end
