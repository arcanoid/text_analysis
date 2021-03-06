# TextAnalysis

[![Build Status](https://travis-ci.org/arcanoid/text_analysis.svg?branch=master)](https://travis-ci.org/arcanoid/text_analysis)
[![Gem Version](https://badge.fury.io/rb/text_analysis.svg)](https://badge.fury.io/rb/text_analysis)

A gem that analyzes given text input in useful info 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'text_analysis'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install text_analysis

## Usage

```ruby
analyzed_text = TextAnalysis.analyze_text("The quick brown fox jumps over the lazy dog")

# This produces the total number of characters
analyzed_text.total_characters

# This produces the total number of characters but without taking 
# into consideration any whitespaces found
analyzed_text.total_characters_without_whitespaces

# This produces the total number of words
analyzed_text.total_words

# This produces the total number of stop words found 
# (as noted in stop words folder per language)
analyzed_text.stop_words_found

# This produces an array of words and the referring number of times found in text
# This list is ordered in descending form.
analyzed_text.most_common_words

# This produces an array of words and the referring number of times found in text.
# From this list any stop words set are excluded.
# This list is ordered in descending form.
analyzed_text.most_common_non_stop_words
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/arcanoid/text_analysis. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
