Spree::LineItem.class_eval do
  def self.order_checkout_state_eq(state = 'complete')
    includes(:order).where("spree_orders.state = ?" , state)
  end
end
