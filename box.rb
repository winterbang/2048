require File.dirname(__FILE__)+'/zwt/matrix'

class Box < Array

	def initialize()

		# 初始化模型
		@box = []

		4.downto(1) do |i|
			@box << [0, 0, 0, 0]
		end

		# 初始化坐标
		@xyzs = []
		0.upto(3) do |i|
			0.upto(3) do |j|
				@xyzs << "#{i}, #{j}"
			end
		end

		first = @xyzs.sample(3)

		# 当前数字的坐标
		@xyzs_varialbal = []

		# 添加3个初始的坐标值
		first.each do |xyz|
			@xyzs_varialbal << xyz
			i, j = xyz.split(',').map(&:to_i)
			@box[i][j] = 2
		end
	end

	# 上移
	def move_up
		tag = [0, 0, 0, 0]
		1.upto(3) do |i|
			i.downto(1) do |j|
				tag = merge(@box[j-1], @box[j], tag)
				if i == 3
					@box[j].each_with_index do |num, index|
						unless num == 0
							@xyzs_varialbal << "#{j},#{index}"
						end
					end 
				end

			end
		end
	end

	# 下移
	def move_down
	end

	# 右移
	def move_right
		
	end

	def move_left
		box = @box.transpose
		tag = [0, 0, 0, 0]
		1.upto(3) do |i|
			i.downto(1) do |j|
				tag = merge(box[j-1], box[j], tag)
				if i == 3
					box[j].each_with_index do |num, index|
						unless num == 0
							@xyzs_varialbal << "#{j},#{index}"
						end
					end 
				end
			end
			@box = box.transpose
		end
	end

	# 矩阵转置
	def transpose
		matrix_t = Array.new(self.column) { Array.new(self.row, 0) }
		@box.each_with_index do |m, i|
			m.each_with_index do |e, j|
				matrix_t[j][i] = e
			end
		end
		return matrix_t
	end

	# 格式化输出
	def format_put
		format_array = ''
		@box.each do |i|
			s = i.join('||')
			format_array += "|#{s}|\n"
		end
		format_array
	end

	private 

	# 按1024的规则合并两行数据，返回操作的标志 0表示未发生相加，1表示发生了相加
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




end