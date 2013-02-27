# coding: UTF-8

class Over
  attr_reader :closed

  def initialize
    @background_img = Image.load("images/gameover.png")
  end

  def play
    @closed = true if Input.keyPush?(K_SPACE)
    Window.draw(0, 0, @background_img)
  end
end
