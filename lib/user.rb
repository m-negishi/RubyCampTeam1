# coding: UTF-8

class User < Sprite
  attr_accessor :map
  def update
    @dx = Input.x * 2
    @dy = Input.y * 2
    self.x += @dx
    self.y += @dy
    
    if (@map.scroll_place < Map::MAP_HEIGHT)
    	self.y -= 0.5
    	
    end
  end

=begin
  def hit(obj)
    self.x -= @dx
    self.y -= @dy
  end

=end

end