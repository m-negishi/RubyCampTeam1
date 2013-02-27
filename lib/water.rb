# coding: utf-8
require 'dxruby'

class Water
	
 	def initialize( tmp_i, tmp_j )
		#@img = water_img
		@map=[
			[0,8,0,0],
			[0,1,0,0],
			[1,1,1,1],
			[1,0,0,9]
		]
		@i = tmp_i
		@j = tmp_j

		@last_points=[[tmp_i, tmp_j]]

		@map[@i][@j]=-1
	end
	
	def move
		# [ [x1, y1], [x2, y2], ...]
		old_points = @last_points.dup
		@last_points.clear
		old_points.each do |(x, y)|
			if x - 1 >= 0 && @map[x - 1][y] > 0
				@map[x - 1][y] = -1
				@last_points << [x - 1, y]
			end

			if x + 1 < 4 && @map[x + 1][y] > 0
				@map[x + 1][y] = -1
				@last_points << [x + 1, y]
			end

			if y - 1 >= 0 && @map[x][y-1] > 0
				@map[x][y-1] = -1
				@last_points << [x, y-1]
			end

			if y + 1 < 4 && @map[x][y+1] > 0
				@map[x][y+1] = -1
				@last_points << [x, y+1]
			end
		end

	end

	def draw
		4.times{ |ii|
			4.times{ |jj|
				if(@map[ii][jj]==-1)
					Window.draw(jj*32,ii*32,Image.new(32,32,[0,0,255]))
				end
			}
		}
	end
end
