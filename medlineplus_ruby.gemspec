# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'medlineplus_ruby/version'

Gem::Specification.new do |spec|
  spec.name          = 'medlineplus_ruby'
  spec.version       = MedlineplusRuby::VERSION
  spec.authors       = ['Todd Morningstar']
  spec.email         = ['techarchist@gmail.com']
  spec.homepage      = 'https://github.com/stratigos/medlineplus_ruby'
  spec.license       = 'MIT'
  spec.summary       = 'Modernize access to the Medlineplus Connect API.'
  spec.description   = 'The National Library of Medicine API, "Medlineplus Connect", can be somewhat cantankerous to ' \
    'work with. Query params are non sensical to end users, query format is from a bygone era, and the resulting ' \
    'responses often contain large amounts of superficial information. The response structures are somewhat ' \
    'inconsistant, and are always non intuitive. This gem simplifies querying the NLM API, and parses the responses '\
    'into something more sane and structured for the average Ruby dev to use. Note that at this time, the only ' \
    'feature available through this gem is querying descriptions for ICD-10 codes, more API interfaces TBD.'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the
  #  'allowed_push_host' to allow pushing to a single host or delete this
  #  section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = 'http://mygemserver.com'
  # else
  #   raise 'RubyGems 2.0 or newer is required to protect against ' \
  #     'public gem pushes.'
  # end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.6'
  spec.add_development_dependency 'webmock', '~> 3.0.1'

  spec.add_runtime_dependency 'json', '~> 2.1.0'
  spec.add_runtime_dependency 'rest-client', '~> 2.0.2'
end
