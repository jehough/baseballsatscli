
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "baseballstatscli/version"

Gem::Specification.new do |spec|
  spec.name          = "baseballstatscli"
  spec.version       = Baseballstatscli::VERSION
  spec.authors       = ["'Jim Hough'"]
  spec.email         = ["'teachlife@outlook.com'"]

  spec.summary       = 'An application to scrape info on yesterdays baseball games and print out selections'
  spec.homepage      = "https://github.com/jehough/baseballsatscli"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/jehough/baseballsatscli"
    spec.metadata["changelog_uri"] = "https://github.com/jehough/baseballsatscli/commits/master"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "nokogiri"
  spec.add_dependency 'rest-open-uri'
  spec.add_dependency 'colorize'
  spec.add_dependency 'tty-table'
end
