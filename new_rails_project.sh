#!/bin/bash
PROJECT=$1
echo "source 'https://rubygems.org'" > Gemfile 
echo 'git_source(:github) { |repo| "https://github.com/#{repo}.git" }' >> Gemfile
echo "ruby '2.6.8'" >> Gemfile
echo "gem 'rails'" >> Gemfile
bundle install
rm Gemfile

rails new . 
echo "gem 'bootstrap'" >> Gemfile
echo "gem 'bootstrap_views_generator'" >> Gemfile
echo "gem 'simple_form'" >> Gemfile 
bundle install
# application.csss
yarn install
rails webpacker:install
rails webpacker:compile
mv ./app/assets/stylesheets/application.css ./app/assets/stylesheets/application.scss
echo "@import 'bootstrap';" >> ./app/assets/stylesheets/application.scss

rails generate simple_form:install --bootstrap
rails generate bootstrap:install --simpleform --layout --devise

