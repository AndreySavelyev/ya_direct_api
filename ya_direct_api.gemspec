# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ya_direct_api/version'

Gem::Specification.new do |spec|
  spec.name          = "ya_direct_api"
  spec.version       = YaDirectApi::VERSION
  spec.authors       = ["Andrey Savelyev"]
  spec.email         = ["savelyev.andrey@gmail.com"]
  spec.summary       = %q{Yandex direct api wrapper gem}
  spec.description   = %q{Yandex direct api wrapper gem}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'activesupport', '>= 3.0.0'
end
