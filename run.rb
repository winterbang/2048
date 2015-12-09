require File.dirname(__FILE__)+'/readkey'
# require 'gosu'

# class MyWindow < Gosu::Window
#   def initialize
#    super(640, 480, false)
#    self.caption = 'Hello World!'
#   end
# end

# window = MyWindow.new
# window.show

# 生成4x4数组 
box = []
4.downto(1) do |i|
	box << [0, 0, 0, 0]
end

# 生成坐标数组
@xyzs = []
0.upto(3) do |i|
	0.upto(3) do |j|
		@xyzs << "#{i},#{j}"
	end
end

# 当前数字的坐标
@xyzs_varialbal = []

first = @xyzs.sample(3)

# 添加3个初始的坐标值
first.each do |xyz|
	@xyzs_varialbal << xyz
	i, j = xyz.split(',').map(&:to_i)
	box[i][j] = 2
end

# 格式化输出
box.each do |i|
	s = i.join('||')
	puts "|#{s}|"
end

# when move up
def move_up
	# 移动

end

# while true
# 	c = read_char
# 	case c
# 	when "\e[A"
#     puts "UP ARROW"
#   when "\e[B"
#     puts "DOWN ARROW"
#   when "\e[C"
#     puts "RIGHT ARROW"
#   when "\e[D"
#     puts "LEFT ARROW"
#   when "\u0003"
#   	puts "CONTROL-C"
#   	exit 0
#   else
#   	p 'error!!!'
#   end
# end