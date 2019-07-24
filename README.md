# CalorieCoach

## About the Application

This application is designed to be used as a nutrition tracker and communication tool between personal trainers and their clients.

It is designed to have separate functionality for clients and trainers, and has the ability to send text and e-mail correspondence.

This application was built using Rails 5, Bootstrap, PostgreSQL, TravisCI, OAuth and RSpec. The microservice is created using Python 3 and Flask, as well as the Nutritionix and Edamam API's. Communication features are implemented through Twilio and Sendgrid.

## Local Setup

Clone down the repo
```
$ git clone
```

Install the gem packages
```
$ bundle install
```

Set up the database
```
$ rake db:create
$ rake db:migrate
$ rake db:seed
```

Run the test suite:
```ruby
$ bundle exec rspec
```

## Technologies
* [TravisCI](https://travis-ci.org)
* [Twilio](https://www.twilio.com/)
* [Sendgrid](https://app.sendgrid.com/)
* [RSpec](http://rspec.info/)
* [vcr](https://github.com/vcr/vcr)
* [Bootstrap](https://getbootstrap.com)

### Versions
* Ruby 2.4.1
* Rails 5.2.3
