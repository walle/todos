if ENV["COVERAGE"]
  require 'simplecov'
  SimpleCov.start do
    add_filter "/test/"
  end
end

require 'test/unit'
require 'rr'

require File.expand_path('../../lib/todo.rb', __FILE__)