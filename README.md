# Bowtie::Template

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'bowtie'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bowtie

## Generating a New Project

```bash
$ bowtie new awesome_app
$ cd awesome_app
$ bundle
$ bowtie start
```

## Testing

```bash
$ cd awesome_app
$ rake
```

## Starting

```bash
$ cd awesome_app
$ bowtie start [environment]
```

## Console

```bash
$ cd awesome_app
$ bowtie console [environment]
```

## Generating a New App

```bash
$ cd awesome_app
$ bowtie generate:app foo_app
```

### Destroying a New App

```bash
$ cd awesome_app
$ bowtie destroy:app foo_app
```

## Generating a New Model

```bash
$ cd awesome_app
$ bowtie generate:model user
```

### Destroying a New Model

```bash
$ cd awesome_app
$ bowtie destroy:model user
```

## Help

```bash
$ bowtie help
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
