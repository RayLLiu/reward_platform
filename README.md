# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


rails db:setup 

rails db:migrate

rails db:seed

bin/rake "user:generate_rewards[test@test.com]"

bin/rake "user:generate_earned_points[test@test.com]"