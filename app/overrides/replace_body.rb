# -*- encoding : utf-8 -*-

Deface::Override.new(:virtual_path => %q{spree/layouts/spree_application},
                          :name => %q{replace_body},
                          :replace => %q{[data-hook='body']},
                          :closing_selector => %q{},
                          :text => %q{<body id="<%= (@body_id == 'signup' ? 'checkout' : @body_id) || controller.controller_name %>">
    <div id="container">
        <header>
          <%= link_to image_tag("store/logo.png", :width => "240", :alt => "Atut", :id => "logo"), root_url %>
          <form action="#" >
          </form>
          <%= form_tag products_url, :method => :get do %>
            <input type="search" id="s1" class="empty" name="keywords" placeholder="Szukaj">
          <% end %>
          <nav>
            <%= link_to "produkty", products_path %>
            <% if current_user %>
              <%= link_to "Moje konto", account_path, :class => "cart" %>
              <%= link_to "Wyloguj", destroy_user_session_path, :class => "cart" %>
            <% else %>
              <%= link_to "Zaloguj się", login_path, :class => "cart" %>
            <% end %>
            <%= link_to_cart %>
          </nav>
        </header>

        <% if content_for?(:banner) %>
          <div id="banner" role="banner">
            <%= yield :banner %>
          </div>
        <% end %>

        <div id="main" role="main">
          <% if flash.notice %>
            <div class="flash notice"><%= flash.notice %></div>
          <% end %>
          <% if flash[:error] %>
            <div class="flash errors"><%= flash[:error] %></div>
          <% end %>

          <%= yield %>
        </div>

        <% if content_for?(:sidebar) %>
          <div id="sidebar" role="sidebar">
            <%= yield :sidebar %>
          </div>
        <% end %>

    </div>

    <footer data-hook="footer">
      <div class="inner">
        <%= image_tag "store/kid.jpg", :width => "204", :height => "413", :alt => "Atut", :id => "kid" %>

        <div id="about-railsdog-radio">
          <div>
            <p>
              <strong>Atut</strong> NIE jest prawdziwym sklepem Internetowym.
              Został zrobiony przez studentów na potrzeby kursu Zarządzanie projektami handlu elektronicznego, na Politechnice Łódzkiej.</p>
          </div>
        </div>

        <div id="contact-us">
          <h3>Kontakt</h3>
          <p>
          (+48) 42 111 222 33
          <br>
          <a href="mailto:sklep@atut.com">sklep@atut.com</a>
          </p>
        </div>

      </div>
    </footer>
</body>})
