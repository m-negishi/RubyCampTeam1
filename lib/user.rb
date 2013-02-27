# coding: UTF-8

class Player < Sprite
  def update
    @dx = Input.x
    @dy = Input.y
    self.x += @dx
    self.y += @dy
  end

  def hit(obj)
    self.x -= @dx
    self.y -= @dy
  end
end