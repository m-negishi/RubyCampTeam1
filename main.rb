# coding: UTF-8

require 'dxruby'

require_relative 'lib/map'
require_relative 'lib/user'
require_relative 'lib/water'
require_relative 'lib/director'

@map = Map.new("images/map01.dat")

Window.loop do
	break if Input.keyPush?(K_ESCAPE)
	@map.draw
end