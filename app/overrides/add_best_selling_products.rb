Deface::Override.new(:virtual_path => 'spree/products/show',
                     :name => 'add_best_selling_products_to_products_show',
                     :insert_after => "#recent-products",
                     :partial => 'spree/shared/best_selling_products')
