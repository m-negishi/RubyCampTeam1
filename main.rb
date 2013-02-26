require 'dxruby'

#‹Á‚«Å¬‚ÌŒ´‘¥
#player_img = Image.load("./images/player.png")
player = Sprite.new(400, 400, Image.load("./images/player.png"))
speed = 5;

Window.loop do
	break if Input.keyPush?(K_ESCAPE)
#	Window.draw(100, 100, player_img)
#	Window.draw(640-32, 480-32, player_img)
#	Window.draw(Window.width - player_img.width,
#				Window.height - player_img.height,
#				player_img)
	player.draw
	player.x += (Input.x * speed)
	player.y += (Input.y * speed)
end