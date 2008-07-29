#!/usr/bin/env ruby
# Author: Bruno Michel <bmichel@menfin.info>
# Licence: MIT <http://www.opensource.org/licenses/mit-license.html>

require 'erb' 


SKELETON_DIR = File.expand_path("~/.vim/skeleton");
EXTENSION  = "erb"

file, filetype = ARGV
filename  = File.basename(file)
skeletons = [filename, filetype]
skeleton  = skeletons.map { |s|
    File.join(SKELETON_DIR, "#{s}.#{EXTENSION}")
}.find { |s|
    File.exist?(s) && File.readable?(s)
}

exit if skeleton.nil?

File.open(skeleton) do |f|
    puts ERB.new(f.read, nil, '<>').result(binding)
end
