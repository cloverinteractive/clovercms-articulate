# Articulate [![Build Status](http://travis-ci.org/cloverinteractive/clovercms-articulate.png)](http://travis-ci.org/cloverinteractive/clovercms-articulate)
## just simple article support for clovercms

## Requirements

* [Bundler](http://gembundler.com)

## Getting Started

To install simply open up `Gemfile` in your favorite editor and add `gem
'clovercms-articulate'` then:

0. `bundle install`
1. `rails g clover_cms:articulate:install`
2. `rake db:migrate`
3. Enjoy

### Wait, wha'?

`rails g clover_cms:articulate:install` copies an articles model and generates an articles migration. Why do we do this? the model is perhaps the piece that is most likely to change so we give you this out of the box to let you set your own validations, custom relationships, etc.

### But I want my views too :(

Simply run `rails g clover_cms:articulate:views` that will copy all the views into your app/views directory.

## Running the tests

You first need to download articulate from git and do as follows:

0. `git clone git://github.com/cloverinteractive/clovercms-articulate.git`
1. `cd clovercms-articulate`
2. `bundle install`
3. `cd test/dummy && rails g clover_cms:articulate:install && cd ../../`
4. `rake`

## Supported platforms

We currently test and integrate in:

* ruby 1.9.2
* ruby 1.8.7
* ree
* jruby 1.6.2

## Run the rails dummy application

This gem comes with a dummy application to test in the browser, just do
the following from the articulate dir:

0. `cd test/dummy`
1. `rails s`
2. You can now visit http://localhost:3000/ in your browser

## Contribute

Feel free fork this project and submit a pull request, don't forget to add yourself to the contributors list in this README file.

## Contributors

* [Enrique Vidal](http://github.com/EnriqueVidal) - Ruby developer
* [Ulises Roche](http://github.com/ulisesroche) - Ruby developer

