# Mina Ridgepole

* [Mina](https://github.com/nadarei/mina)
* [Ridgepole](https://github.com/winebarrel/ridgepole)

This gem provides mina task

    mina ridgepole:apply         # apply DB schema.
    mina ridgepole:apply_dryrun  # dry-run apply DB schema.
    mina ridgepole:export        # export DB schema.

## Installation

Add this line to your application's Gemfile:

    gem 'mina-ridgepole', :require => false

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mina-ridgepole

you can set other option by setting follow variables:

* `ridgepole_config` - ridgepole database file, default is `shared/config/database.yml`
* `ridgepole_schemafile` - ridgepole schemafile, default `Schemafile`
* `ridgepole_options` - ridgepole additional options, default `""`


## Usage

Add this to your `config/deploy.rb` file:

    require 'mina/ridgepole'

## Example

    require 'mina/ridgepole'

      ...

    task :deploy do
      deploy do
        invoke :'git:clone'
        invoke :'deploy:link_shared_paths'
        invoke :'bundle:install'
        invoke :'ridgepole:apply'
        ...

      end
    end

