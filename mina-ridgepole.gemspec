# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mina/ridgepole/version'

Gem::Specification.new do |spec|
  spec.name          = 'mina-ridgepole'
  spec.version       = Mina::Ridgepole::VERSION
  spec.authors       = ['Isao Sugimoto']
  spec.email         = ['d6rkaiz@gmail.com']
  spec.description   = %q{Ridgepole tasks for Mina}
  spec.summary       = %q{Ridgepole tasks for Mina}
  spec.homepage      = 'https://github.com/d6rkaiz/mina-ridgepole'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'mina'
  spec.add_dependency 'ridgepole', '~> 0.6.0'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
