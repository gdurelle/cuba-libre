[![Build Status](https://travis-ci.org/gdurelle/cuba-libre.svg?branch=master)](https://travis-ci.org/gdurelle/cuba-ibre)


# Cuba::Libre

Cuba-libre is now a cocktail AND a generator to help creating Cuba projects.

[Cuba](https://github.com/soveran/cuba) is a micro-framework for Ruby based on Rack.

## Installation

    $ gem install cuba-libre

## Usage

    $ cuba new [projectName]

This will create your cuba project with its 2 files:

* The config.ru to ```rackup```your project.
* The projectname.rb file that contains your project config and routes.

## Todo

Next evolutions of the gem will be :

* Refactor using [Thor](https://github.com/erikhuda/thor) gem.
* Add options and arguments to command line (see [Issue #1](https://github.com/gdurelle/cuba-libre/issues/1))

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cuba-libre/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
