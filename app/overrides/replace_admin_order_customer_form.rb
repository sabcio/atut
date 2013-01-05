# -*- encoding : utf-8 -*-

Deface::Override.new(:virtual_path => %q{spree/admin/orders/customer_details/_form},
                          :name => %q{replace_billing},
                          :replace => %q{[data-hook='admin_customer_detail_form_fields']},
                          :text => %q{
<div data-hook="admin_customer_detail_form_fields">
  <h3><%= t(:customer_details) %></h3>
  <table class="index" data-hook="customer_guest">
    <thead>
      <th colspan="8"><%= t(:account) %></th>
    </thead>
    <tbody>
      <tr data-hook="customer_fields">
        <td class="lbl-col"><%= f.label :email, t(:email) + ':' %></td>
        <td class="val-col" colspan="3"><%= f.email_field :email, :class => 'fullwidth' %></td>
        <td class="lbl-col"><%= label_tag nil, t(:guest_checkout) %>:</td>
        <td class="val-col" colspan="3">
          <% if @order.completed? %>
            <%= @order.user.nil? ? t(:yes) : t(:no) %>
          <% else %>
            <% guest = @order.user.nil? || @order.user.anonymous? %>
            <label class="sub">
              <%= radio_button_tag :guest_checkout, true, guest %>
              <%= t(:yes) %>
            </label> &nbsp;
            <label class="sub">
              <%= radio_button_tag :guest_checkout, false, !guest, :disabled => @order.cart? %>
              <%= t(:no) %>
            </label>
            <%= hidden_field_tag :user_id, @order.user_id %>
          <% end %>
        </td>
      </tr>
    </tbody>
  </table>

  <h3><%= Spree::Address.model_name.human %></h3>
  <%= f.fields_for :bill_address do |ba_form| %>
    <%= render :partial => 'spree/admin/shared/address_form', :locals => { :f => ba_form, :name => t(:billing_address), :use_billing => false } %>
  <% end %>

  <%= f.fields_for :ship_address do |sa_form| %>
    <%= render :partial => 'spree/admin/shared/address_form', :locals => { :f => sa_form, :name => t(:shipping_address), :use_billing => true } %>
  <% end %>

  <p class="form-buttons" data-hook="buttons">
    <%= button @order.cart? ? t(:continue) : t(:update) %>
  </p>

  <% content_for :head do %>
    <%= javascript_include_tag states_path, 'admin/address_states.js' %>
  <% end %>
</div>
})
