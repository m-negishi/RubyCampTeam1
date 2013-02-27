# coding: UTF-8

require 'dxruby'
require_relative 'lib/director'

user_img = Image.load("images/user.png")
user_img.setColorKey([0, 0, 0])

wall_img = Image.load("images/wall.png")

pipe_img = Image.load("images/pipe.png")

water_img = Image.load("images/water.png")

objects = []
objects << User.new(400, 300, user_img)
objects << Wall.new(100, 100, wall_img)

water = []
water << Water.new(228, 228, water_img)

pipe = []
pipe << Pipe.new(228, 100, pipe_img)


Window.loop do
	break if Input.keyPush?(K_ESCAPE)
	
	Sprite.update(objects)
  Sprite.check(objects, objects)
	Sprite.check(objects, water)
	Sprite.draw(water)
  Sprite.draw(pipe)
	Sprite.draw(objects)

director = Director.new

Window.loop do
	break if Input.keyPush?(K_ESCAPE)	
	director.play
	@map = Map.new("images/map01.dat")
end