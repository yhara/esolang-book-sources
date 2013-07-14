require 'open-uri'

open("http://www.ruby-lang.org/") do |f|
  puts f.read
end
