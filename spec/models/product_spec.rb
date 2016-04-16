require 'rails_helper'
describe Product do
  context "when the product has comments" do
    before do
      @product = Product.create!(name: 'race bike')
      @user = User.create!(email: 'bob@bob.com', password: 'unitedfdfdf')
      @product.comments.create!(rating: 1, user: @user, body: "Awful bike!")
      @product.comments.create!(rating: 3, user: @user, body: "Really Awful bike!")
      @product.comments.create!(rating: 5, user: @user, body: "Really Really Awful bike!")
    end#before
    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3.0
    end
  end#context

    context "the product is submitted without a name" do
      before do
        @product = Product.build(description: 'THE race bike')
      end
      it 'is not valid' do
        expect(Product.build(description: "nice bike")).not_to be_valid
      end

    end



end#classProduct
