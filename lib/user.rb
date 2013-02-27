# coding: UTF-8

class User < Sprite
  def update
    @dx = Input.x * 3
    @dy = Input.y * 3
		self.x += @dx
    self.y += @dy
		self.x -= @dx unless (0..Window.width - self.image.width).include?(self.x)
		self.y -= @dy unless (0..Window.height - self.image.height).include?(self.y)
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


