class Box < Array

	def initialize()
		@box = []
		4.downto(1) do |i|
			@box << [0, 0, 0, 0]
		end

		@xyz = []
		0.upto(3) do |i|
			0.upto(3) do |j|
				@xyz << "#{i}, #{j}"
			end
		end
	end

end