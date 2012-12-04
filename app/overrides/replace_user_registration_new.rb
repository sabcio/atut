# -*- encoding : utf-8 -*-

 Deface::Override.new(:virtual_path => %q{spree/user_registrations/new},
                          :name => %q{replace_user_registration_new},
                          :replace => %q{#new-customer},
                          :text => %q{<div id="new_customers">
    <h2>Nowy klient</h2>
    <p>Możesz się zarejestrować wypełniając poniższy formularz:</p>
    <%= form_for :user, :url => spree.user_registration_path(@user) do |f| %>
        <%= render :partial => 'spree/shared/user_form', :locals => { :f => f } %>
        <p><%= f.submit "Zarejestruj", :class => 'button primary' %></p>
    <% end %>
  </div>})
