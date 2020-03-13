require_relative 'lib/noname/version'

Gem::Specification.new do |spec|
  spec.name          = "Flash Cards - Sturdy Cards App"
  spec.version       = Noname::VERSION
  spec.authors       = ["Guan Kuan Lee"]
  spec.email         = ["angusl.zanshin@gmail.com"]

  spec.summary       = "something"
  spec.description   = "something longer to write"
  spec.homepage      = "https://github.com/codebender16?tab=repositories"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "colorize", "~> 0.8.1"
  spec.add_dependency "tty-font', '~> 0.5.0"
end

#this will be shown on gem page

# to update gem in github
# git status 
# git add .
# git commit -m <URL> 
# git remote add origin <URL>
# git remote -v
# git push -u origin master

# curl -u <gkuanlee16> https://rubygems.org/api/v1/api_key.yaml > ~/.gem/credentials; chmod 0600 ~/.gem/credentials
# gem signin

# building a gem 
# gem build noname.gemspec

# udpating the gem
# rake build --> another version of gem will be created --> move the version file to "pkg"
# pushing the update
# gem push pkg/noname-version.gem