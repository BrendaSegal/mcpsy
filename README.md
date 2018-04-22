# README

# Running the server locally
## To run the server, do:
`bundle install`
`rails server` and then head to `http://localhost:3000/admin`

## To run migrations, do:
`rake db:migrate`

# Tests
## To run tests, do:
### All tests
`bin/rails test`

### Single test file
`bin/rails test test/models/patient_test.rb`

### Test at specific line
`bin/rails test test/models/patient_test.rb:10`

# Debugging
## In ruby code:
`binding.pry` and look at your command line server after you run your code

## In html.erb file:
`<% binding.pry %>` and look at your command line server after you run your code



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
