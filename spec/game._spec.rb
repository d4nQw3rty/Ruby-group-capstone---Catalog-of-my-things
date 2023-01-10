require 'rspec'
require_relative '../game'

describe Game do
  it "should be able to be archived" do
    game = Game.new('Super Mario', '1990-01-01', true, '2010-01-01')
    expect(game.can_be_archived?).to be true
  end

  it "should not be able to be archived" do
    game = Game.new('Super Mario', '1990-01-01', true, '2022-01-01')
    expect(game.can_be_archived?).to be false
  end
end