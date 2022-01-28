# Postcode checker

This is a very basic application checking if a postcode is served or not. We are using HTTParty to send requests.

## Getting Started
### Dependencies
* [Ruby 2.7.1]
* [Rails 5.2.6]
### Installation
* `cd` to the repo
* Run `bundle install` to install Ruby dependencies
* Run `bundle exec rails s` to start the development server, which can be found at [`http://localhost:3000`](http://localhost:3000/) by default
### Running Tests
* Run `bundle exec rspec`
### Help!
I have used yml file to store allowed LSOA and postcodes. In production, I would have adopted database approach to store this information in the tables and access it from there.
