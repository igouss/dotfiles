IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:PROMPT_MODE] = :SIMPLE

require 'irb/completion'
require 'pp'
require 'rubygems'

puts "Yay! Completion's loaded!" #Uhh, that's my special debugging code :-)
