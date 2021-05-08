# frozen_string_literal: true

require_relative './bakery'

RSpec.describe 'Bakery' do
  it 'should determine the bread vegemite scroll, provide the appropriate solution, and total' do
    bread = decode('10 VS5')
    expect(bread[0]).to eq([2, 0])
    expect(bread[1]).to eq([5, 3])
    expect(bread[2]).to eq(17.98)
  end

  it 'should determine the bread blueberry muffin, provide the appropriate solution, and total' do
    bread = decode('14 MB11')
    expect(bread[0]).to eq([1, 0, 3])
    expect(bread[1]).to eq([8, 5, 2])
    expect(bread[2]).to eq(54.8)
  end
  it 'should determine the bread croissant, provide the appropriate solution, and total' do
    bread = decode('13 CF')
    expect(bread[0]).to eq([0, 2, 1])
    expect(bread[1]).to eq([9, 5, 3])
    expect(bread[2]).to eq(25.85)
  end
end
