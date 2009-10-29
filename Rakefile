require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "gem_dir"
    s.summary = "Gem Command to easily locate a ruby gem."
    s.description = <<-DESC
      Prints the install directory for the selected gem.
    DESC
    s.email = "mperham@gmail.com"
    s.homepage = "http://github.com/mperham/gem_dir"
    s.authors = ["Mike Perham"]
    s.has_rdoc = false
    s.files = FileList["[A-Z]*", "{bin,lib,test}/**/*"]
    
    # Testing
    s.test_files = FileList["test/**/*_test.rb"]
    s.add_development_dependency 'mocha', '~> 0.9.5'
  end

rescue LoadError
  puts "Jeweler not available. Install it for jeweler-related tasks with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task :default => :test