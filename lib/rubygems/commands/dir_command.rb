require 'shellwords'

require 'rubygems/command'
require 'rubygems/dependency'
require 'rubygems/version_option'

# OpenCommand will open a gem's source path
class Gem::Commands::DirCommand < Gem::Command
  include Gem::VersionOption
  
  def initialize
    super 'dir', "Prints the install directory of the selected gem", 
      :command => nil, 
      :version=>  Gem::Requirement.default,
      :latest=>   false
    
    add_option('-l', '--latest',
               'If there are multiple versions, open the latest') do |value, options|
      options[:latest] = true
    end
    
    add_version_option
  end
  
  def arguments # :nodoc:
    "GEMNAME       gem to use"
  end

  def execute
    name = get_one_gem_name
    path = get_path(name)
    
    dir_gem(path) if path
  end
  
  def get_path(name)
    dep = Gem::Dependency.new name, options[:version]
    specs = Gem.source_index.search dep
    
    if specs.length == 0
      say "Could not find '#{name}'"
      return nil
      
    elsif specs.length == 1 || options[:latest]
      return specs.last.full_gem_path
      
    else
      choices = specs.map{|s|"#{s.name} #{s.version}"}
      c,i = choose_from_list "Use which gem?", choices
      return specs[i].full_gem_path if i
      
    end
  end
  
  def dir_gem(path)
    puts path
  end
end