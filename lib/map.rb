# coding: UTF-8

class Map
  def initialize(map_file)
    @chips = Image.loadToArray(File.join(File.dirname(__FILE__), "..", "images", "map_chips.png"), 4, 4)
    @map_data = []
    File.open(map_file).each do |line|
      @map_data << line.chomp.split(/\s*,\s*/)
    end
    @map_width = 20
    @map_height = 15
    @c_w = @chips.first.width
    @c_h = @chips.first.height
    @scroll_place = 0
    @scroll_count = 0
  end

  def draw
  	if  (@scroll_count % 60) == 0 && @scroll_place + 1 <= @map_height
    	@scroll_place += 1
    end
    @scroll_count += 1
    @map_height.times do |my|
      @map_width.times do |mx|
        tmp = @chips[@map_data[my + @scroll_place][mx].to_i]
        Window.draw((mx * @c_w), (my * @c_h), tmp)
      end
    end
  end
end