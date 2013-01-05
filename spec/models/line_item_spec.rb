require 'spec_helper'

describe Spree::LineItem do
  describe "#order_checkout_state_eq" do
    before do
      @li = FactoryGirl.create :line_item
      @order = FactoryGirl.create :order, state: 'complete'
      @order.line_items << @li

      @li_incomplete = FactoryGirl.create :line_item
    end

    it "should return only line items with complete orders" do
      Spree::LineItem.order_checkout_state_eq.count.should == 1
      Spree::LineItem.order_checkout_state_eq.should == [@li]
    end
  end
end
