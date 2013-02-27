# coding: UTF-8

require 'dxruby'

require_relative 'lib/map'
require_relative 'lib/user'
require_relative 'lib/water'
require_relative 'lib/director'
require_relative 'lib/title'
require_relative 'lib/ending'
require_relative 'lib/scene'

title = Title.new
ending = Ending.new

Scene.add_scene(:title,  title)
Scene.add_scene(:ending,  ending)

Scene.set_scene(:title)

Window.loop do
	break if Input.keyPush?(K_ESCAPE) || ending.closed
	
	Scene.play
end