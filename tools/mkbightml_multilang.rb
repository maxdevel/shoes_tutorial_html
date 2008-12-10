# mkbightml_multilang.rb
require 'rubygems'
require 'bluecloth'

ARGV[0]  ? @lang = ARGV[0] : @lang = 'en'

puts "#@lang"

data_directory = File.expand_path(File.join("../html/", "#@lang"))
unless File.exist?(data_directory)
      Dir.mkdir(data_directory)
end

big_mdown = IO.read('../README.mdown') + "\n\n"
head = IO.read('./head.erb')

Dir.glob("../mdowns/#@lang/*.mdown").each{|file| big_mdown << IO.read(file) << "\n\n"}

b = BlueCloth.new big_mdown

template = "<html><head>#{head}</head><body><div id='content'>#{b.to_html.gsub(/<code>/, '<code class="ruby">')}<div></body></html>"
open("../html/#@lang/ShoesTutorialNote.html", 'w'){|f| f.puts template}
=begin
=end