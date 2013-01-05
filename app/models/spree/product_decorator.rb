Spree::Product.class_eval do

  def self.best_selling_variants(amount = 5)
    #li = LineItem.sum(:quantity, :group => :variant_id, :limit => 5)
    li = Spree::LineItem.order_checkout_state_eq.sum(:quantity, group: :variant_id, limit: 5)

    variants = li.map do |v|
      variant = Spree::Variant.find(v[0])
      [variant.product, v[1]]
    end
    variants.sort { |x,y| y[1] <=> x[1] }.first(amount)
  end

end
