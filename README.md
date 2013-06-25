# Deano

A starter template and generators for Sinatra. This project is _incredibly_ opinionated. It will set up an asset pipeline using Sprockets. It sets up Twitter Bootstrap, RSpec, Mongoid, and Backbone as well.

Use at your own risk.

## Installation

Add this line to your application's Gemfile:

    gem 'deano'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install deano

## Generating a New Project

```bash
$ deano new awesome_app
$ cd awesome_app
$ bundle
$ deano start
```

## Testing

```bash
$ cd awesome_app
$ rake
```

## Starting

```bash
$ cd awesome_app
$ deano start [environment]
```

## Console

```bash
$ cd awesome_app
$ deano console [environment]
```

## Generating a New App

```bash
$ cd awesome_app
$ deano generate:app foo_app
```

### Destroying a New App

```bash
$ cd awesome_app
$ deano destroy:app foo_app
```

## Generating a New Model

```bash
$ cd awesome_app
$ deano generate:model user
```

### Destroying a New Model

```bash
$ cd awesome_app
$ deano destroy:model user
```

## Help

```bash
$ deano help
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Contributors

* Mark Bates
* Luke Bergen
* Allen Wyma
