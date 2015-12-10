require File.dirname(__FILE__)+'/zwt/matrix'

class Box < Array

	def initialize()

		# 初始化模型
		@box = []
		@box_pre = []

		4.downto(1) do |i|
			@box << [0, 0, 0, 0]
		end

		# 初始化坐标
		@xyzs = []
		0.upto(3) do |i|
			0.upto(3) do |j|
				@xyzs << "#{i},#{j}"
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

	def get_box
		@box
	end

	# 随机选择一个空白格子放入一个2或4(各占50%概率)
	def add_2_or_4
		sample_xyzs = @xyzs - @xyzs_varialbal
		i, j = sample_xyzs.sample().split(',').map(&:to_i)
		@box[i][j] = [2, 4].sample()
	end

	# 上移
	def move_up
		@xyzs_varialbal = []

		box = @box.map do  |array|
			array.clone
		end

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

			if i == 3
				box[0].each_with_index do |num, index|
					unless num == 0
						@xyzs_varialbal << "#{0},#{index}"
					end
				end 
			end
		end

    box 
	end

	# 下移
	def move_down
		@xyzs_varialbal = []

		box = @box.reverse.map do  |array|
			array.clone
		end
		tag = [0, 0, 0, 0]
		1.upto(3) do |i|
			i.downto(1) do |j|
				tag = merge(box[j-1], box[j], tag)
				if i == 3
					box[j].each_with_index do |num, index|
						unless num == 0
							@xyzs_varialbal << "#{3-j},#{index}"
						end
					end 
				end
			end

			if i == 3
				box[0].each_with_index do |num, index|
					unless num == 0
						@xyzs_varialbal << "#{3},#{index}"
					end
				end 
			end
		end

		box.reverse

	end

	# 右移
	def move_right
		@xyzs_varialbal = []

		box = @box.transpose.reverse.map do  |array|
			array.clone
		end
		tag = [0, 0, 0, 0]
		1.upto(3) do |i|
			i.downto(1) do |j|
				tag = merge(box[j-1], box[j], tag)
				if i == 3
					box[j].each_with_index do |num, index|
						unless num == 0
							@xyzs_varialbal << "#{index},#{3-j}"
						end
					end 
				end
			end

			if i == 3
				box[0].each_with_index do |num, index|
					unless num == 0
						@xyzs_varialbal << "#{index},#{3}"
					end
				end 
			end
		end

		box.reverse.transpose

	end

	def move_left
		@xyzs_varialbal = []

		box = @box.transpose.map do  |array|
			array.clone
		end
		tag = [0, 0, 0, 0]
		1.upto(3) do |i|
			i.downto(1) do |j|
				tag = merge(box[j-1], box[j], tag)
				if i == 3
					box[j].each_with_index do |num, index|
						unless num == 0
							@xyzs_varialbal << "#{index},#{j}"
						end
					end 
				end
			end

			if i == 3
				box[0].each_with_index do |num, index|
					unless num == 0
						@xyzs_varialbal << "#{index},#{0}"
					end
				end 
			end
		end

		box.transpose

	end

	['up', 'down', 'left', 'right'].each do |val|
    self.class_eval <<-EOF
      def move_#{val}!
        box = move_#{val}
				if @box == box
					return false
				else
					@box = box
					return true
				end
      end
    EOF
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

	def can_move?
		move_statues = [1, 1, 1, 1] # [右, 下, 左, 上]
		move_statues[0] = 0 if @box == move_right
		move_statues[1] = 0 if @box == move_down
		move_statues[2] = 0 if @box == move_left
		move_statues[3] = 0 if @box == move_up

		return move_statues.include?(1) ? move_statues : false
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