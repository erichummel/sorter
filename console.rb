require 'irb'
require './sorter'

def self.help!
  puts "Commands:"
  puts "  config <path> : Load a configuration file"
  puts "  test : Run the test suite"
  puts "  sort <width>, <height>, <length>, <mass> : Sort a package"
  puts "  help! : Display this help message"
  puts
end

def self.config(path = "config.yml")
  puts "Loading config from #{path}"
  @sorter = Sorter.new(config_path: path)
end

def self.sort(width, height, length, mass)
  @sorter.sort(width, height, length, mass)
end

def self.test
  puts `rspec spec --color`
end

config
help!

IRB.start
