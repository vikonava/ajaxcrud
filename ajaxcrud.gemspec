# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ajaxcrud/version"

Gem::Specification.new do |s|
  s.name        = "ajaxcrud"
  s.version     = Ajaxcrud::VERSION
  s.authors     = ["Viko Nava"]
  s.email       = ["viko.nava@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Scaffolding with Ajax}
  s.description = %q{Creates complete scaffolds using ajax to create, edit and destroy on the same page. Also includes a real-time search field.}

  s.rubyforge_project = "ajaxcrud"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
