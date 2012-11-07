# atut

A ecommerce project using [Spree](http://spreecommerce.com/) for Zarządzanie projektami w handlu elektornicznym.

## Getting started

After install rubies install bundler gem:

    gem install bundler

Install all gems needed for application

    bundle install

When complete, create ```config/database.yml``` you can use ```config/database.example.yml``` as a template. Create a 'atut' user in the database of your choice (postgresql assumed). Then create a database, run migrations, add seed data using:

    rake db:setup

Optionally add some sample Spree products, categories, orders with:

    rake spree_sample:load

Now you can start application with:

    bundle exec rails server

Open ```http://localhost:3000/``` with web browser

## Deploying

First, make sure you gave you ssh public key to admin, so you have access to our server.

Then deploy you application with: ```cap deploy```

When we will have production environment ```cap production deploy```
