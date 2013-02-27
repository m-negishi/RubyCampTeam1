# coding: UTF-8

require_relative 'scene'
require_relative 'title'
require_relative 'ending'
require_relative 'game'
require_relative 'over'

class Director
	def initialize
		game = Game.new
		title = Title.new
		ending = Ending.new
		over = Over.new
		
		Scene.add_scene(:title,  title)
		Scene.add_scene(:ending,  ending)
		Scene.add_scene(:game,  game)
		Scene.add_scene(:over,  over)
		
		Scene.set_scene(:title)
	end
	
	def play
		
		Scene.play
	end
end