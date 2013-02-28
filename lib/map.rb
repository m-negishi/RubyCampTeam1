# coding: UTF-8

# マップ用関連をまとめたクラス
# @map.new で initialize(map_file) が呼ばれる 引数はマップチップの画像ファイル名
# @map.draw で drawが呼ばれる
# draw での処理
# 呼ばれた回数を時間処理用にカウント
# 時間処理用のカウントが60の倍数(1秒)ならスクロール量を繰り上げ
# 縦方向のループの中で横方向のループをさせます。
# その中で、マップチップを決められたデータ(外部ファイル)の順に並べます。
#
#
# 出力
# データ順に並べられたマップ 各チップはSpriteクラスにより記述(判定可)


#クラス Map
class Map
  # マップ初期化処理
  def initialize(map_file)
    @chips = Image.loadToArray(File.join(File.dirname(__FILE__), "..", "images", "map_chips2.png"), 4, 4)
    @map_data = []				# draw で使用する配列の確保
    # マップデータファイルを開いて、「 , 」を区切りとして
    # 改行でひとつのラインとして @map_date に最後まで順次格納
    File.open(map_file).each do |line|
      @map_data << line.chomp.split(/\s*,\s*/)
    end
    @map_width = 20				# マップの横幅
    @map_height = 15			# マップの縦幅
    @c_w = @chips.first.width	# @chips配列の先頭の横幅
    @c_h = @chips.first.height	# @chips配列の先頭の縦幅
    @scroll_place = 0			# スクロールする量
    @scroll_count = 0			# スクロールに使うカウント用変数
  end
	
  # @map.drawで呼ばれるメソッド
  def draw
        # マップの縦方向の数ループ
    (@map_height + 1).times do |my|
    	# マップの横方向の数ループ
      @map_width.times do |mx|
      	# 長くなり見づらいので @chips を一時的に tmp に格納してから次で使用
        tmp = @chips[@map_data[my + @scroll_place][mx].to_i]
        # 絵を出すだけのdrawですが、デバック用にコメントアウト
        # Window.draw((mx * @c_w), (my * @c_h), tmp)
        map_chips = Sprite.new((mx * @c_w), (my * @c_h - @scroll_count), tmp)
        Sprite.draw(map_chips)
      end
    end
    if @scroll_place < 15
      @scroll_count += (32 / 60.0)			# drawの呼ばれた回数をカウント
      if @scroll_count >= 32.0
         @scroll_place += 1
         @scroll_count = 0
      end
    end
  end
end