# -*- encoding: utf-8 -*-
require File.expand_path '../lib/minitest-activemodel/version', __FILE__

Gem::Specification.new do |gem|
  gem.name             = 'minitest-activemodel'
  gem.version          = MiniTest::Matchers::ActiveModel::VERSION

  gem.authors          = ['Francesco Rodriguez']
  gem.email            = ['lrodriguezsanc@gmail.com']
  gem.description      = %q{MiniTest Matchers for ActiveModel::Validations}
  gem.summary          = gem.description
  gem.homepage         = 'https://github.com/frodsan/minitest-activemodel'

  gem.files            = `git ls-files`.split "\n"
  gem.executables      = `git ls-files -- bin/*`.split("\n").map{|f| File.basename f }
  gem.test_files       = `git ls-files -- test/*`.split "\n"
  gem.extra_rdoc_files = ['CHANGELOG.md', 'LICENSE.md', 'README.md']
  gem.rdoc_options     = ['--charset=UTF-8']
  gem.require_paths    = ['lib']

  gem.add_dependency 'minitest', '>= 4.0.0'
  gem.add_dependency 'minitest-matchers', '~> 1.2.0'
  gem.add_dependency 'activemodel', '~> 3.2.0'

  gem.add_development_dependency 'activerecord', '~> 3.2.0'
  gem.add_development_dependency 'sqlite3', '~> 1.3.6'
  gem.add_development_dependency 'rake'
end
