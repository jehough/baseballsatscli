require "baseballstatscli/version"
require 'nokogiri'
require 'open_uri'
require 'colorize'
require 'tty-table'

require_relative 'baseballstatscli/games.rb'
require_relative 'baseballstatscli/scraper.rb'
require_relative 'baseballstatscli/version.rb'
require_relative 'baseballstatscli/cli.rb'
module Baseballstatscli
  class Error < StandardError; end
  # Your code goes here...
end
