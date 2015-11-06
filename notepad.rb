#encoding: utf-8
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'post.rb'
require_relative 'link.rb'
require_relative 'task.rb'
require_relative 'memo.rb'

puts 'Блокнот v1.0'
puts 'Какие данные следует записать?'

choises = Post.post_types

choice = -1

until choice >= 0 && choice < choises.size
  choises.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end
  choice = STDIN.gets.chomp.to_i
end

entry = Post.create(choice)
entry.read_from_console
entry.save

puts "Запись сохранена"