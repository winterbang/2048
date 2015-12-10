require File.dirname(__FILE__)+'/readkey'
require File.dirname(__FILE__)+'/box'
box = Box.new

puts 'I'
puts box.format_put

box.move_down!
box.move_right!

while box.can_move?
  status = box.can_move?
  moved = false
  status.each_with_index do |statu, i|
    if statu == 1 
      case i 
      when 0
        moved = box.move_right!
        puts 'R'
        break
      when 1
        moved = box.move_down!
        puts 'D'
        break
      when 2
        moved = box.move_left!
        puts 'L'
        break
      when 3
        puts 'U'
        moved = box.move_up!
        break
      end
    else
      next
    end
  end
  box.add_2_or_4 if moved
  puts box.format_put
  p box.can_move?
end
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