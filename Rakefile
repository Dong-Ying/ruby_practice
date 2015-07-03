# encoding: utf-8
fail "This script shouldn't be run as root user ◴_◶" if Process.euid == 0

require 'rubygems'
require 'bundler'

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end


$LOAD_PATH << File.expand_path('lib', File.dirname(__FILE__))

require 'rake'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)
task :default => :spec
