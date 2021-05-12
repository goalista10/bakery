# frozen_string_literal: true

require_relative './bakery'

RSpec.describe 'Bakery' do
  it 'should determine the bread vegemite scroll, provide the appropriate solution, and total' do
    solution, variables, total = decode('10 VS5')
    expect(solution).to eq([2, 0])
    expect(variables).to eq([5, 3])
    expect(total).to eq(17.98)
  end

  it 'should determine the bread blueberry muffin, provide the appropriate solution, and total' do
    solution, variables, total = decode('14 MB11')
    expect(solution).to eq([1, 0, 3])
    expect(variables).to eq([8, 5, 2])
    expect(total).to eq(54.8)
  end
  it 'should determine the bread croissant, provide the appropriate solution, and total' do
    solution, variables, total = decode('13 CF')
    expect(solution).to eq([0, 2, 1])
    expect(variables).to eq([9, 5, 3])
    expect(total).to eq(25.85)
  end

  it 'should raise error for invalid amount' do
    expect { decode('7 VS5') }.to raise_error(InvalidBreadAmount, /The amount you entered is invalid/)
  end

  it 'should raise error for invalid code' do
    expect { decode('10 VS4') }.to raise_error(InvalidBreadCode, /The code you entered is invalid/)
  end
end
