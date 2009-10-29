require 'test/unit'
require 'rubygems'
require 'mocha'

require 'rubygems/commands/dir_command'
require 'rubygems/exceptions'

class Test_SomethingToTest < Test::Unit::TestCase
  def setup
  end

  def test_opening_path
    gem_name = 'neat_gem'
    gem_path = 'some/path'
    command = Gem::Commands::DirCommand.new
    
    command.expects(:get_path).with(gem_name).returns(gem_path)
    command.expects(:dir_gem).with(gem_path)
    
    command.invoke(gem_name)
  end
  
  def test_opening_nonexistent_path
    gem_name = 'neat_gem'
    gem_path = nil
    command = Gem::Commands::DirCommand.new
    
    command.expects(:get_path).with(gem_name).returns(gem_path)
    command.expects(:dir_gem).never
    
    command.invoke(gem_name)
  end
  
  def test_opening_with_no_gem_name
    command = Gem::Commands::DirCommand.new
    
    assert_raises Gem::CommandLineError do
      command.invoke()
    end
  end
end