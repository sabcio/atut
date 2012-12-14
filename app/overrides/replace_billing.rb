# -*- encoding : utf-8 -*-

Deface::Override.new(:virtual_path => %q{spree/checkout/_address},
                          :name => %q{replace_billing},
                          :replace => %q{#billing[data-hook]},
                          :text => %q{
<div id="content" role="content">
  <h2>Dane do płatności</h2>
  <fieldset id="billing" data-hook>
    <%= form.fields_for :bill_address do |bill_form| %>
      <div id="billing">
      <ul class="inner fields">
        <li class="half">
          <%= bill_form.label :firstname, t(:first_name) %>
          <%= bill_form.text_field :firstname %>
        </li>
        <li class="half last">
          <%= bill_form.label :lastname, t(:last_name) %>
          <%= bill_form.text_field :lastname %>
        </li>
        <li>
          <%= bill_form.label :address1, t(:street_address) %>
          <%= bill_form.text_field :address1 %>
        </li>
        <li>
          <%= bill_form.label :address2, t(:street_address_2) %>
          <%= bill_form.text_field :address2 %>
        </li>
        <li>
          <%= bill_form.label :city, t(:city) %>
          <%= bill_form.text_field :city %>
        </li>
        <li class="half">
          <%= bill_form.label :zipcode, t(:zip) %>
          <%= bill_form.text_field :zipcode %>
        </li>
        <li class="half last">
          <%= bill_form.label :country_id, t(:country) %>
          <span id="bcountry">
            <%= bill_form.collection_select :country_id, available_countries.uniq.sort, :id, :name %>
          </span>
        </li>
        <li>

        </li>
        <li>
          <%= bill_form.label :phone, t(:phone) %>
          <%= bill_form.text_field :phone %>
        </li>
      </ul>
      </div>
    <% end %>
  </fieldset>
  <hr/>

  <h2>Dane do wysyłki</h2>
  <fieldset id="shipping" data-hook>
  <%= form.fields_for :ship_address do |ship_form| %>
    <div id="shipping">
      <ul class="fields">
        <li>
          <%= check_box_tag 'order[use_billing]', '1', (!(@order.bill_address.empty? && @order.ship_address.empty?) && @order.bill_address.eql?(@order.ship_address)) %>
          <label class="tick">Use my billing address</label>
        </li>
      </ul>
      <ul class="inner fields">
        <li class="half">
          <%= ship_form.label :firstname, t(:first_name) %>
          <%= ship_form.text_field :firstname %>
        </li>
        <li class="half last">
          <%= ship_form.label :lastname, t(:last_name) %>
          <%= ship_form.text_field :lastname %>
        </li>
        <li>
          <%= ship_form.label :address1, t(:street_address) %>
          <%= ship_form.text_field :address1 %>
        </li>
        <li>
          <%= ship_form.label :address2, t(:street_address_2) %>
          <%= ship_form.text_field :address2 %>
        </li>
        <li>
          <%= ship_form.label :city, t(:city) %>
          <%= ship_form.text_field :city %>
        </li>
        <li class="half">
          <%= ship_form.label :zipcode, t(:zip) %>
          <%= ship_form.text_field :zipcode %>
        </li>
        <li class="half last">
          <%= ship_form.label :country_id, t(:country) %>
          <span id="scountry">
            <%= ship_form.collection_select :country_id, Spree::Country.all, :id, :name %>
          </span>
        </li>
        <li>
          <%= ship_form.label :phone, t(:phone) %>
          <%= ship_form.text_field :phone %>
        </li>
      </ul>
    </div>
  <% end %>
</fieldset>
  <div class="submit"><button type="submit" class="blue">Dalej</button></div>
</div>})
