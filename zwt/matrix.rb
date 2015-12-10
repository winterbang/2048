module Zwt

	class Matrix

		attr_accessor :matrix

		def initialize(matrix=[[1]])
			raise ArgumentError, "argument must be a array" if !matrix.kind_of?(Array)
			@matrix = matrix
		end

		# 矩阵的行数
		def row
			@matrix.length
		end

		# 矩阵的列数
		def column
			@matrix.first.length			
		end

		# 矩阵的类型，即行数和列数
		def type
			[self.row, self.column]
		end

		# 矩阵转置
		def transpose
			matrix_t = Array.new(self.column) { Array.new(self.row, 0) }
			@matrix.each_with_index do |m, i|
				m.each_with_index do |e, j|
					matrix_t[j][i] = e
				end
			end
			return matrix_t
		end

		# 两个矩阵积运算，参数必须为Zwt::Matrix对象
		def * mt
			raise ArgumentError, "the rows of argument must equal the columns of the matrixs instance " if self.column != mt.row
			result = Matrix.generate_matrix self.row, mt.column
			mt = mt.transpose
			@matrix.each_with_index do |row, i|
				mt.each_with_index do |col, j|
					result[i][j] = row.multiply_map_sum col
				end
			end
			return result
		end

		# 两个矩阵的和运算
		def + mt
			raise ArgumentError, "the row and column of two matrixs must be equality " if self.type != mt.type
			result = []
			@matrix.each_with_index do |row, i|
				result << row.add_map(mt.matrix[i])
			end
			return result
		end

		class << self

			# 生成指定行数和列数的矩阵
			def generate_matrix row=nil, col=nil
				if row.nil?
					matrix = nil
				elsif col.nil?
					matrix = Array.new(row) { Array.new(row) }
				else
					matrix = Array.new(row) { Array.new(col) }
				end 
				return matrix
			end

		end

	end
end

