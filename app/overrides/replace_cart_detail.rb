Deface::Override.new(:virtual_path => %q{spree/orders/_form},
                          :name => %q{replace_cart_detail},
                          :replace => %q{#cart-detail[data-hook]},
                          :text => %q{<table id="cart-detail" data-hook>
  <thead>
    <tr data-hook="cart_items_headers">
      <th colspan="2"><%= t("item") %></th>
      <th style="width: 90px"><%= t("price") %></th>
      <th>&nbsp;</th>
      <th><%= t("qty") %></th>
      <th>&nbsp;</th>
      <th style="width: 90px"><%= t("total") %></th>
      <th>&nbsp;</th>
    </tr>
  </thead>
  <tbody id="line_items" data-hook>
    <%= order_form.fields_for :line_items do |item_form| %>
      <%= render :partial => 'line_item', :locals => { :variant => item_form.object.variant, :line_item => item_form.object, :item_form => item_form } %>
    <% end %>
  </tbody>
  <%= render "spree/orders/adjustments" unless @order.adjustments.eligible.blank? %>
</table>})
