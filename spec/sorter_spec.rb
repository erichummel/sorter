require 'rspec'
require './sorter'
require './package'

describe Sorter do
  it "raises an error if no config file is specified" do
    expect { Sorter.new }.to raise_error(ArgumentError)
  end

  it "loads a config file" do
    sorter = Sorter.new(config_path: "spec/config.test.yml")
    expect(sorter.config).to eq({
      max_mass: 20,
      max_volume: 1000000,
      max_unit: 150,
      standard_key: "STANDARD",
      special_key: "SPECIAL",
      rejected_key: "REJECTED"
    })
  end

  it "sorts packages into the correct categories" do
    sorter = Sorter.new(config_path: "config.yml")
    standard_dimensions = { width: 3, height: 4, length: 2, mass: 10}
    special_dimensions_heavy = { width: 3, height: 4, length: 2, mass: 20}
    special_dimension_sorta_bulky = { width: 1, height: 1, length: 150, mass: 10}
    special_dimensions_really_bulky = { width: 100, height: 100, length: 100, mass: 10}
    rejected_dimensions = { width: 100, height: 100, length: 100, mass: 20}

    expect(sorter.sort(*standard_dimensions.values)).to eq("STANDARD")
    expect(sorter.sort(*special_dimensions_heavy.values)).to eq("SPECIAL")
    expect(sorter.sort(*special_dimension_sorta_bulky.values)).to eq("SPECIAL")
    expect(sorter.sort(*special_dimensions_really_bulky.values)).to eq("SPECIAL")
    expect(sorter.sort(*rejected_dimensions.values)).to eq("REJECTED")
  end
end
