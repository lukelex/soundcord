require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/test*.rb'] + FileList['test/languages/pt_br/test*.rb'] + FileList['test/languages/en/test*.rb']
  t.verbose = true
end

desc "Run tests"
task :default => :test