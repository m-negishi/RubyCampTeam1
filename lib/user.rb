# coding: UTF-8

class User < Sprite
  def initialize(x, y, user_file)
		@scroll_count = 0
    @scroll_place = 0
	@wall_size = 32
    super
	end

	def update
    @dx = Input.x * 3
    @dy = Input.y * 3
		self.x += @dx
    self.y += @dy
    self.x -= @dx unless (0..Window.width - self.image.width).include?(self.x)
		self.y -= @dy unless (0..Window.height - self.image.height).include?(self.y)
		if @scroll_place < 15
      @scroll_count += (32 / 60.0)
			if self.y > 0
      	self.y -= (32 / 60.0)
			end
			if @scroll_count >= 32.0
      	@scroll_place += 1
				@scroll_count = 0
      end
    end
	end
	
	def hit_water(map)
		@map = map
		#É}ÉbÉvÇÃïù,çÇÇ≥
		@w = @map[0].size
		@h = @map.size
		ux1 = self.x
		uy1 = self.y
		ux2 = self.x + 16
		uy2 = self.y + 16

		@h.times{ |i|
			@w.times{ |j|
				if @map[i][j] ==-1
					wx1 = j * @wall_size
					wy1 = (i - @scroll_place) * @wall_size - @scroll_count
					wx2 = (j+1)*@wall_size
					wy2 = (i + 1 - @scroll_place) * @wall_size - @scroll_count
					if (ux1<=wx2)&&(wx1<=ux2)&&(uy1<=wy2)&&(wy1<=uy2)
						return true
					end
				end
			}
		}
		return false
	end

begin

  def hit(obj)
    self.x -= @dx
    self.y -= @dy
  end

end

end
