class Package
  attr_reader :length, :width, :height, :mass
  def initialize(width:, height:, length:, mass:)
    @width = width
    @height = height
    @length = length
    @mass = mass

    raise InvalidDimensionsError, "all dimensions must be positive numbers" unless valid?
  end

  def volume
    length * width * height
  end

  class InvalidDimensionsError < StandardError; end

  private

  def valid?
    return false unless [length, width, height, mass].all? { |dimension| dimension.is_a?(Numeric) }
    return false unless [length, width, height, mass].all?(&:positive?)
    true
  end
end
