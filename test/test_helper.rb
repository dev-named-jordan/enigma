require 'simplecov'
SimpleCov.start do
  add_filter './lib/enigma_repl'
end
require 'minitest/autorun'
require 'minitest/pride'
require 'date'
require './lib/enigma'
require './lib/generator'
require 'mocha/minitest'
