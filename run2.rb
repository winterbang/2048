require File.dirname(__FILE__)+'/readkey'
require File.dirname(__FILE__)+'/box'
box = Box.new

puts 'I'
puts box.format_put

while true
	c = read_char
	case c
	when "\e[A"
    puts "U"
    box.move_up
    puts box.format_put
  when "\e[B"
    puts "DOWN ARROW"
  when "\e[C"
    puts "RIGHT ARROW"
  when "\e[D"
    puts "LEFT ARROW"
    box.move_left
    puts box.format_put
  when "\u0003"
  	puts "CONTROL-C"
  	exit 0
  else
  	p 'error!!!'
  end
end