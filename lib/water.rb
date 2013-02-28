# coding: utf-8
require 'dxruby'

class Water
	
 	def initialize( tmp_i, tmp_j )

		@map = []
		File.open("data/stage1.dat").each do |line|
			@map << line.chomp.split(/\s*,\s*/)
    	end

		@i = tmp_i
		@j = tmp_j
		
		#�}�b�v�̕�,����
		@w = @map[0].size
		@h = @map.size
		
		@h.times{ |i|
			@w.times{ |j|
				@map[i][j] = @map[i][j].to_i
			}
		}

		@wall_size = 32
		
		@water_img = Image.new(@wall_size, @wall_size, [0,0,255])

		#���̐擪��ۑ�����z��
		@last_points=[[tmp_i, tmp_j]]
	
		#�X�^�[�g�̐Z��
		@map[@i][@j]=-1
		
		
		@t=0
		@w_time = 10#���̑���(w_time��̃��[�v�ň��i��)
		@s_time = 60#�X�N���[���̃^�C�~���O
		#�X�N���[�����邩�ǂ��� 0:���Ȃ�,1:����
		@sc_f = 1
		
		#Sprite�p�z��
		@objects = []
		@obj_img = Image.new(@wall_size, @wall_size, C_RED)
		#@objects << Sprite.new( @j*@wall_size, @i*@wall_size, @obj_img)

	end
	
	def move
		#���̐�[���ړ�
		#�Z�������ꍇ��-1�ɂ���
		if(@t % @w_time == 0 && @t > 0)
			old_points = @last_points.dup
			@last_points.clear
			old_points.each do |(x, y)|

					if x - 1 >= 0 && @map[x - 1][y] > 0
						@map[x - 1][y] = -1
						@last_points << [x - 1, y]

						#@objects << Sprite.new( y*@wall_size, (x-1)*@wall_size, @obj_img)

					end
				
					if x + 1 < @h && @map[x + 1][y] > 0
						@map[x + 1][y] = -1
						@last_points << [x + 1, y]

						#@objects << Sprite.new( y*@wall_size, (x+1)*@wall_size, @obj_img)
					end
				
					if y - 1 >= 0 && @map[x][y-1] > 0
						@map[x][y-1] = -1
						@last_points << [x, y-1]

						#@objects << Sprite.new( (y-1)*@wall_size, x*@wall_size, @obj_img)
					end

					if y + 1 < @w && @map[x][y+1] > 0
						@map[x][y+1] = -1
						@last_points << [x, y+1]

						#@objects << Sprite.new( (y+1)*@wall_size, x*@wall_size, @obj_img)
					end
			end
		end
		@t+=1
		
		return @map

	end
	
	#�Z���ӏ��̕`��
	def draw

		@h.times{ |i|
			@w.times{ |j|
				if(@map[i][j]==-1)
					if @t / @s_time < @h - Window.height / @wall_size
						Window.drawAlpha(j * @wall_size,i * @wall_size - ( @sc_f * @t / @s_time ) * @wall_size  ,@water_img,128)
					else
						Window.drawAlpha(j * @wall_size,i * @wall_size - ( @h - Window.height / @wall_size ) * @wall_size  ,@water_img,128)
					end
				end
			}
		}
		
	end
end
