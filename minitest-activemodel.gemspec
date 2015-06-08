# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.name             = 'minitest-activemodel'
  gem.version          = '1.1.0'

  gem.authors          = ['Francesco Rodriguez', 'Ryan McGeary']
  gem.email            = ['frodsan@protonmail.ch', 'ryan@mcgeary.org']
  gem.description      = %q{MiniTest matchers for ActiveModel::Validations}
  gem.summary          = gem.description
  gem.homepage         = 'https://github.com/frodsan/minitest-activemodel'
  gem.licenses         = ['MIT']

  gem.files            = `git ls-files`.split "\n"
  gem.executables      = `git ls-files -- bin/*`.split("\n").map{|f| File.basename f }
  gem.test_files       = `git ls-files -- test/*`.split "\n"
  gem.extra_rdoc_files = ['CHANGELOG.md', 'LICENSE.md', 'README.md']
  gem.rdoc_options     = ['--charset=UTF-8']
  gem.require_paths    = ['lib']

  gem.required_ruby_version = '>= 1.9.3'

  gem.add_dependency 'minitest', '~> 5.0'
  gem.add_dependency 'activemodel', '>= 3.2'

  gem.add_development_dependency 'minitest-matchers'
  gem.add_development_dependency 'activerecord', '>= 3.2'
  gem.add_development_dependency 'sqlite3', '~> 1.3.6'
  gem.add_development_dependency 'rake'
end
