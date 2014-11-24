# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tictactoe_j8th/version'

Gem::Specification.new do |spec|
  spec.name          = "tictactoe_j8th"
  spec.version       = TictactoeJ8th::VERSION
  spec.authors       = ["j8th"]
  spec.email         = ["jgoodman@8thlight.com"]
  spec.summary       = %q{TicTacToe game logic with an unbeatable AI.}
  spec.description   = %q{A gem encapsulating the logic of a tic tac toe game with an unbeatable AI.}
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
end
