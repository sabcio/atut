Deface::Override.new(:virtual_path => %q{spree/checkout/_address},
                     :name => %q{remove_shipping},
                     :disable => true,
                     :remove => %q{#shipping[data-hook]})
