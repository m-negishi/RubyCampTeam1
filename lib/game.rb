# coding: UTF-8

require_relative 'map'
require_relative 'water'
require_relative 'user'

class Game
  def initialize
    @map = Map.new("sample1.dat")
		@user_img = Image.load("images/user.png")
		@user_img.setColorKey([0, 0, 0])
		@user = User.new(0, 0, @user_img)
  end

  def play
    Scene.set_scene(:ending) if Input.keyPush?(K_SPACE)
    Scene.set_scene(:over) if Input.keyPush?(K_SPACE)
    Scene.set_scene(:ending) if Input.keyPush?(K_RETURN)
		@map.draw
		Sprite.update(@user)
		Sprite.draw(@user)
  end
end
