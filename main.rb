# coding: UTF-8

require 'dxruby'

require_relative 'lib/director'

<<<<<<< HEAD
director = Director.new

Window.loop do
	break if Input.keyPush?(K_ESCAPE)
	
	director.play
=======
@map = Map.new("images/map01.dat")

Window.loop do
	break if Input.keyPush?(K_ESCAPE)
	@map.draw
>>>>>>> kurumada
end