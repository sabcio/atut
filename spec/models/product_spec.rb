require 'spec_helper'

describe Spree::Product do
  describe ".best_selling_variants" do
    before do
      @li1 = FactoryGirl.create :line_item, quantity: 5
      @li2 = FactoryGirl.create :line_item
      mock = mock(sum: [[@li1.variant, @li1.quantity], [@li2.variant, @li2.quantity]])
      Spree::LineItem.stub(:order_checkout_state_eq).and_return(mock)
    end

    it "should return products with sold quantity" do
      Spree::Product.best_selling_variants.should == [
        [@li1.variant.product, 5],
        [@li2.variant.product, 1]
       ]
    end
  end
end
