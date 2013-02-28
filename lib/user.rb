# coding: UTF-8

class User < Sprite
  def initialize(x, y, user_file)
		@scroll_count = 0
    @scroll_place = 0
    super
	end

	def update
    @dx = Input.x * 3
    @dy = Input.y * 3
		self.x += @dx
    self.y += @dy
    self.x -= @dx unless (0..Window.width - self.image.width).include?(self.x)
		self.y -= @dy unless (0..Window.height - self.image.height).include?(self.y)
		if (@scroll_count % 60) == 0
      if (self.image.height..Window.height - self.image.height).include?(self.y) &&
          @scroll_place + 1 <= 15
    	    self.y -= 32 #map1マスのサイズ
      end
      @scroll_place += 1
    end
		@scroll_count += 1
	end

=begin
  def hit(obj)
    self.x -= @dx
    self.y -= @dy
  end

	def shot(obj)
	end
=end

end


