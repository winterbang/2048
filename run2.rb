require File.dirname(__FILE__)+'/readkey'
require File.dirname(__FILE__)+'/box'
box = Box.new

puts 'I'
puts box.format_put

# while true
# 	c = read_char
# 	case c
# 	when "\e[A"
#     puts "U"
#     # box.move_up
#     box.add_2_or_4 if box.move_up.include?(1)
#     puts box.format_put
#   when "\e[B"
#     puts "D"
#     # box.move_down
#     box.add_2_or_4 if box.move_down.include?(1)
#     puts box.format_put
#   when "\e[C"
#     puts "R"
#     # box.move_right
#     box.add_2_or_4 if box.move_right.include?(1)
#     puts box.format_put
#   when "\e[D"
#     puts "L"
#     # box.move_left
#     box.add_2_or_4 if box.move_left.include?(1)
#     puts box.format_put
#   when "\u0003"
#   	puts "CONTROL-C"
#   	exit 0
#   else
#   	p 'error!!!'
#   end
# end