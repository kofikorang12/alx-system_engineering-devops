#!/usr/bin/env ruby
#bash script to print phone number

puts ARGV[0].scan(/^\d{10}$/).join
