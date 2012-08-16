# -*- encoding: utf-8 -*-
require File.expand_path '../lib/minitest-activemodel/version', __FILE__

Gem::Specification.new do |gem|
  gem.name          = 'minitest-activemodel'
  gem.version       = MiniTest::Matchers::ActiveModel::VERSION

  gem.authors       = ['Francesco Rodriguez']
  gem.email         = ['lrodriguezsanc@gmail.com']
  gem.description   = %q{MiniTest Matchers for ActiveModel::Validations}
  gem.summary       = %q{MiniTest Matchers for ActiveModel::Validations}
  gem.homepage      = 'https://github.com/frodsan/minitest-activemodel'

  gem.files         = Dir.glob('{lib}/**/*') + %w(LICENSE README.md CHANGELOG.md)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename f  }
  gem.test_files    = gem.files.grep(%r{^(test)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'minitest', '~> 3.3.0'
  gem.add_development_dependency 'minitest-sugar'
end
