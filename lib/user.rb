# coding: UTF-8

class User < Sprite
  def update
    @dx = Input.x * 2
    @dy = Input.y * 2
    self.x += @dx
    self.y += @dy
  end

=begin
  def hit(obj)
    self.x -= @dx
    self.y -= @dy
  end

=end

end


