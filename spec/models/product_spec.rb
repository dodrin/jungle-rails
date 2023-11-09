require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    # declare category to keep the test DRY
    before(:each) do
      @category = Category.new(name: 'Kusa')
    end

    it 'saves a product successfully' do
      product = @category.products.new({name: 'Kusa', price: 900, quantity: 4})
      expect(product).to be_valid
    end     

    it 'validates presence of name' do
      product = @category.products.new(price: 900, quantity: 4)
      expect(product).not_to be_valid
      expect(product.errors[:name]).to include("can't be blank")
    end

    it 'validates presence of price' do
      product = @category.products.new(name: 'Nazonokusa', quantity: 4)
      expect(product).not_to be_valid
      expect(product.errors[:price]).to include("can't be blank")
    end

    it 'validates presence of quantity'do
      product = @category.products.new(name: 'Nazonokusa', price: 1000)
      expect(product).not_to be_valid
      expect(product.errors[:quantity]).to include("can't be blank")
    end

    it 'validates presence of category' do
      product = Product.new(name: 'Kusa', price: 900, quantity: 4)
      expect(product).not_to be_valid
      expect(product.errors[:category]).to include("can't be blank")
    end
    
  end
end
