require 'yaml'
require './package'

class Sorter
  attr_reader :config

  def initialize(config_path:)
    @config = YAML.load_file(config_path)
  end

  def sort(length, width, height, mass)
    package = Package.new(length: length, width: width, height: height, mass: mass)
    if standard?(package)
      return config[:standard_key]
    elsif special?(package)
      return config[:special_key]
    else
      return config[:rejected_key]
    end
  end

  private

  def bulky?(package)
    package.volume >= config[:max_volume] || [package.length, package.width, package.height].max >= config[:max_unit]
  end

  def heavy?(package)
    package.mass >= config[:max_mass]
  end

  def special?(package)
    bulky?(package) ^ heavy?(package)
  end

  def standard?(package)
    !special?(package) && !rejected?(package)
  end

  def rejected?(package)
    bulky?(package) && heavy?(package)
  end
end
