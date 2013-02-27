# coding: UTF-8

class Ending
  attr_reader :closed

  def initialize
    @background_img = Image.load("images/ending.png")
  end

  def play
    @closed = true if Input.keyPush?(K_SPACE)
    Window.draw(0, 0, @background_img)
  end
end
