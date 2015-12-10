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

# [0, 2, 0, 4], [2, 2, 0, 6] => [2, 4, 0, 4], [0, 0, 0, 6]
def merge(a1, a2, tag=[0, 0, 0, 0])
	a1.each_with_index do |num, i|
		case num
		when 0
			a1[i] = a2[i]
			a2[i] = 0
		when a2[i]
			if tag[i] == 0
				a1[i] *= 2
				tag[i] = 1
				a2[i] = 0
			end
		else
			next
		end
	end
	tag
end

# when move up
def move_up
	tag = [0, 0, 0, 0]
	1.upto(3) do |i|
		i.downto(1) do |j|
			tag = merge(box[j-1], box[j], tag)
		end
	end
end

while true
	c = read_char
	case c
	when "\e[A"
    puts "UP ARROW"
	  tag = [0, 0, 0, 0]
		1.upto(3) do |i|
			i.downto(1) do |j|
				tag = merge(box[j-1], box[j], tag)
			end
		end

		box.each do |i|
			s = i.join('||')
			puts "|#{s}|"
		end
  when "\e[B"
    puts "DOWN ARROW"
  when "\e[C"
    puts "RIGHT ARROW"
  when "\e[D"
    puts "LEFT ARROW"
  when "\u0003"
  	puts "CONTROL-C"
  	exit 0
  else
  	p 'error!!!'
  end
end