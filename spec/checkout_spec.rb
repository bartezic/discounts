require_relative '../lib/constants'
require_relative '../lib/checkout'
require_relative '../lib/rule'

describe Checkout do
  context 'when buy FR, SR, FR, FR, CF' do
    it 'returns 22.45 in total' do
      checkout = Checkout.new(PROMOS)
      checkout.scan('FR')
      checkout.scan('SR')
      checkout.scan('FR')
      checkout.scan('FR')
      checkout.scan('CF')
      expect(checkout.total).to eq(22.45)
    end
  end

  context 'when buy FR, FR' do
    it 'returns 3.11 in total' do
      checkout = Checkout.new(PROMOS)
      checkout.scan('FR')
      checkout.scan('FR')
      expect(checkout.total).to eq(3.11)
    end
  end

  context 'when buy SR, SR, FR, SR' do
    it 'returns 16.61 in total' do
      checkout = Checkout.new(PROMOS)
      checkout.scan('SR')
      checkout.scan('SR')
      checkout.scan('FR')
      checkout.scan('SR')
      expect(checkout.total).to eq(16.61)
    end
  end
end