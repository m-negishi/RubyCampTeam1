# coding: UTF-8

require_relative 'map'
require_relative 'water'
require_relative 'user'

class Game
  def initialize
    @map = Map.new("data/stage1.dat")
		@user_img = Image.load("images/user.png")
		@gameover_img = Image.load("images/gameover.png")
		@user_img.setColorKey([255, 255, 255])
		@user = User.new(168, 70, @user_img) #スタート位置座標(168, 70)

	#水に関する変数
	@map_water = []
	File.open( "data/stage1.dat" ).each do | line |
		@map_water << line.chomp.split( /\s*,\s*/ )
	end

	@water = nil
	@map_w = @map_water[0].size
	@map_h = @map_water.size

	@map_h.times{ |i|
		@map_w.times{ |j|
			if( @map_water[i][j].to_i == 1 )
				@water = Water.new( i, j )
			end
		}
	}
	#ここまで
  end

  def play
    Scene.set_scene(:ending) if Input.keyPush?(K_SPACE)
    Scene.set_scene(:over) if Input.keyPush?(K_SPACE)
    Scene.set_scene(:ending) if Input.keyPush?(K_RETURN)
		@map.draw
		Sprite.update(@user)
		Sprite.draw(@user)
		
		#水関係
		@map_water = @water.move
		@water.draw
		font = Font.new(32)
		if @user.hit_water(@map_water) == true
		
		Window.drawFont(100, 100, "衝突中", font)
	  Window.draw( 0, 0 ,@gameover_img)
		end

		Sprite.check(@map.all_map_chips, @user)
  end
end
