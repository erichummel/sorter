require 'rspec'
require './package'

describe Package do
  it "requires all dimensions to be present" do
    expect { Package.new(length: 1, width: 2) }.to raise_error(ArgumentError)
    expect(Package.new(length: 1, width: 2, height: 3, mass: 10)).to be_a(Package)
  end

  it "calculates the volume of a package" do
    package = Package.new(length: 2, width: 3, height: 4, mass: 10)
    expect(package.volume).to eq 24
  end

  it "errors if any dimension is zero" do
    expect { Package.new(length: 0, width: 2, height: 3, mass: 10) }.to raise_error(Package::InvalidDimensionsError)
    expect { Package.new(length: 1, width: 0, height: 3, mass: 10) }.to raise_error(Package::InvalidDimensionsError)
    expect { Package.new(length: 1, width: 2, height: 0, mass: 10) }.to raise_error(Package::InvalidDimensionsError)
    expect { Package.new(length: 1, width: 2, height: 3, mass: 0) }.to raise_error(Package::InvalidDimensionsError)

  end

  it "errors if any dimension is negative" do
    expect { Package.new(length: -1, width: 2, height: 3, mass: 10) }.to raise_error(Package::InvalidDimensionsError)
    expect { Package.new(length: -1, width: -2, height: 3, mass: 10) }.to raise_error(Package::InvalidDimensionsError)
    expect { Package.new(length: 1, width: 2, height: 3, mass: -10) }.to raise_error(Package::InvalidDimensionsError)
  end

  it "errors if any dimension is not a number" do
    expect { Package.new(length: "a", width: 2, height: 3, mass: 10) }.to raise_error(Package::InvalidDimensionsError)
  end
end
