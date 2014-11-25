# TictactoeJ8th

A gem encapsulating the logic of a tic tac toe game with an unbeatable AI.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tictactoe_j8th'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tictactoe_j8th

## Usage

Everything is in a TictactoeJ8th module.
You get Game, Board, Human, and AI.

```ruby
include TictactoeJ8th
Game.new(Board.new, Human.new(:X), AI.new(:O))
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/tictactoe_j8th/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
