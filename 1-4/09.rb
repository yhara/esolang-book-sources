#!/usr/bin/env ruby
$LOAD_PATH.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'whitespace'

Whitespace.run(ARGF.read)
