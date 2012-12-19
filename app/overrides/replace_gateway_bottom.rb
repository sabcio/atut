# -*- encoding : utf-8 -*-

Deface::Override.new(:virtual_path => %q{spree/checkout/payment/_gateway},
                          :name => %q{replace_gateway_bottom},
                          :replace => %q{[data-hook='card_code']},
                          :text => %q{<div>
  <%= label_tag nil, t(:card_code) %><br />
  <%= text_field_tag "#{param_prefix}[verification_value]", '', :class => 'required', :size => 5 %>
</div>})
