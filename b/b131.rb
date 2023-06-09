# データ取得パート

# 1行目取得
s = gets.chomp
puts s

t = s.split.map(&:to_i)

train_lines_num = t[0]
stations_num = t[1]

stations_list = []
train_lines_num.times do
  s = gets.chomp
  t = s.split.map(&:to_i)
  stations_list << t
end

# N+1行目取得
s = gets.chomp.to_i

expected_stations_num = s
expected_stations_list = []

expected_stations_num.times do
  s = gets.chomp
  t = s.split.map(&:to_i)
  expected_stations_list << t
end


# データ取得パート終わり
# 下のようなデータを取得できた

''' stations_list, expected_stations_listの形式
    [
      [1, 2, 3, 4, 5],
      [1, 2, 3, 4, 5],
      ...
    ]
'''





# fareの計算用メソッド

fare = 0
# loop回数用のint
loop_num = expected_stations_list.length - 1

loop_num.times do |i|
  # 前の座標
  _line = expected_stations_list[i][0] - 1 # int
  _station = expected_stations_list[i][1] - 1 # int

  # 次の座標
  line_ = expected_stations_list[i+1][0] - 1 # int
  station_ = expected_stations_list[i+1][1] - 1 # int

  # 同じ路線の場合
  if _line == line_
    # 右方向の場合
    if _station < station_
      fare += stations_list[line_][station_] - stations_list[_line][_station]
    # 左方向の場合
    else
      fare += stations_list[_line][_station] - stations_list[line_][station_]
    end
  # 異なる路線の場合
  else
    # 次の路線と同じ位置の駅に移動する
    tmp_station = stations_list[line_][_station]
    # 路線移動した後の駅から次の駅までの距離を計算する
    # 右方向の場合
    if _station < station_
      fare += stations_list[line_][station_] - tmp_station
    # 左方向の場合
    else
      fare += tmp_station - stations_list[line_][station_]
    end
  end
  print _line
  print _station
  print line_
  print station_
  print fare
end

# 最後に一つ目の駅を足す
# 必要な引数　


first_line = expected_stations_list[0][0] - 1
first_station = expected_stations_list[0][1] - 1
fare += expected_stations_list[first_line][first_station]
print fare


