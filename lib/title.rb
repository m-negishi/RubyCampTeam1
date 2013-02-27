# coding: UTF-8

class Title
  def initialize
    @background_img = Image.load("images/title.png")
  end

  def play
    Scene.set_scene(:game) if Input.keyPush?(K_SPACE)
    Window.draw(0, 0, @background_img)
  end
end
