# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mina/lock/version'

Gem::Specification.new do |spec|
  spec.name          = 'mina-lock'
  spec.version       = Mina::Lock::VERSION
  spec.authors       = ['Lorenzo Sinisi']
  spec.email         = ['info@lorenzosinisi.com']
  spec.summary       = 'Lock the deplyment with mina'
  spec.description   = ''
  spec.homepage      = 'https://github.com/lorenzosinisi/mina-lock'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end
