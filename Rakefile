require 'rubygems'
require 'rake/gempackagetask'

PLUGIN = "merb_geokit"
NAME = "merb_geokit"
VERSION = "0.0.2"
AUTHOR = "Dusty Doris"
EMAIL = "merb@dusty.name"
HOMEPAGE = "http://code.google.com/p/merb-geokit/"
SUMMARY = "Merb plugin that provides the geokit rails plugin"

spec = Gem::Specification.new do |s|
  s.name = NAME
  s.version = VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README", "LICENSE", 'TODO']
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.add_dependency('merb', '>= 0.5.0')
  s.add_dependency('activerecord')
  s.require_path = 'lib'
  s.autorequire = PLUGIN
  s.files = %w(LICENSE README Rakefile TODO) + Dir.glob("{lib,specs}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

task :install => [:package] do
  sh %{sudo gem install pkg/#{NAME}-#{VERSION}}
end
