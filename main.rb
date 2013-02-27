require 'dxruby'

require_relative 'lib/map'
require_relative 'lib/user'
require_relative 'lib/water'

Window.loop do
	break if Input.keyPush?(K_ESCAPE)
end