# coding: UTF-8

require 'dxruby'

require_relative 'lib/map'
require_relative 'lib/user'
require_relative 'lib/water'
require_relative 'lib/director'

Window.loop do
	break if Input.keyPush?(K_ESCAPE)
	
end