# MoodBoard API

MoodBoard API is a RESTful API built in Rails 5.2.

Please review the below instructions to get WeatherBug up and running on your local machine for development and testing purposes.

The base URL for the API is https://mood-board-be.herokuapp.com/.

## Table of Contents

* Schema
* Endpoint Explanation
* Prerequisites
* Testing Dependencies
* APIs consumed (keys required)
* Additional Gems
* Installation
* Running the Test Suite

## Schema
![](schema.png)

## Endpoint Explanation

All API requests must have the following headers:

```
Content-Type: application/json
Accept: application/json
```

## Prerequisites

* Ruby v. 2.4
* Rails v. 5.2
* Puma v. 3.7
* PG v. 1.1.3

## APIs Consumed (keys required) / External Services


## Testing Dependencies

* Rspec-Rails
* Capybara
* Factory_bot_rails
* Webmock
* VCR
* Faraday

## Additional Gems

* Bcrypt
* Fast_jsonapi
* Shoulda-matchers
* Database_cleaner
* Figaro

## Installation
Clone down this repository, change into the root directory and run:

`bundle`

To setup the database necessary for this API, run the following commands:

`bundle exec rake db:create`

`bundle exec rake db:migrate`

## Running the Test Suite

Run `bundle exec rspec` to run the full test suite.

Run `bundle exec rspec <TEST FILE PATH>` to run a specific test
