# coding: UTF-8

require_relative 'map'
require_relative 'water'
#require_relative 'user'

class Game
  def initialize
    @map = Map.new("sample1.dat")
  end

  def play
    Scene.set_scene(:ending) if Input.keyPush?(K_SPACE)
    @map.draw
  end
end
