class Array

	def multiply_map a
		result_array = []
		self.zip(a) do |e|
			# result_array << e[0]*e[1]
			result_array << e.inject(:*)
		end
		return result_array
	end

	def add_map a
		result_array = []
		self.zip(a) do |e|
			# result_array << e[0]+e[1]
			result_array << e.inject(:+)
		end
		return result_array
	end

	def multiply_map_sum a
		self.multiply_map(a).inject(:+)
	end

end
