# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'text_analysis/version'

Gem::Specification.new do |spec|
  spec.name          = "text_analysis"
  spec.version       = TextAnalysis::VERSION
  spec.authors       = ["Vasilis Kalligas"]
  spec.email         = ["billkall@gmail.com"]

  spec.summary       = %q{A gem that converts inserted text input to useful information.}
  spec.description   = %q{TextAnalysis is a gem that given a text input, can produce a list of text analysis information such as word and character count.}
  spec.homepage      = "https://github.com/arcanoid/text_analysis"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-its"
end
