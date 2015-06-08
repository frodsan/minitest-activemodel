# minitest-activemodel

[![Gem Version](http://img.shields.io/gem/v/minitest-activemodel.svg)](https://rubygems.org/gems/minitest-activemodel)
[![Build Status](https://secure.travis-ci.org/frodsan/minitest-activemodel.svg?branch=master)](http://travis-ci.org/frodsan/minitest-activemodel)
[![Dependency Status](https://gemnasium.com/frodsan/minitest-activemodel.svg)](https://gemnasium.com/frodsan/minitest-activemodel)
[![Code Climate](https://codeclimate.com/github/frodsan/minitest-activemodel.svg)](https://codeclimate.com/github/frodsan/minitest-activemodel)

MiniTest matchers for `ActiveModel::Validations`.

## Support

This gem supports:

+ Ruby 1.9.3, 2.0.0, ruby-head, rbx-19mode.
+ ActiveModel 3.2.x.

## Installation

Add this line to your application's Gemfile:

    gem 'minitest-activemodel', group: :test

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install minitest-activemodel

Then, you have to include the matchers into `Minitest::Test`

    class Minitest::Test
      include MiniTest::Matchers::ActiveModel
    end

## Usage

Check the [official documentation](http://rubydoc.info/github/frodsan/minitest-activemodel/master/frames)
for more details.

## Contributing

Read [CONTRIBUTING](https://github.com/frodsan/minitest-activemodel/blob/master/CONTRIBUTING.md).

## License

MIT License. Copyright 2012 Francesco Rodriguez. See [LICENSE.md](https://github.com/frodsan/minitest-activemodel/blob/master/LICENSE.md)
for more information.
