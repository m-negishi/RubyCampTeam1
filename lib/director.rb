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
	  @sound = Sound.new("sound/play.wav")  
   
		Scene.set_scene(:title)
	end
	
	def play
	 @sound.play
	 if Input.keyPush?(K_Z)
    @sound.stop
    end
		#���ƃv���C���[�̏Փ˔��肪�K�v
		#�v���C���[�Ɛ����ǂ̏Փ˔��肪�K�v
		Scene.play
	end
end