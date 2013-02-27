# coding: UTF-8

require 'dxruby'

require_relative 'lib/map'
require_relative 'lib/user'
require_relative 'lib/water'
require_relative 'lib/director'
require_relative 'lib/title'
require_relative 'lib/ending'
require_relative 'lib/scene'
require_relative 'lib/game'

director = Director.new

Window.loop do
	break if Input.keyPush?(K_ESCAPE)
	
	director.play
end