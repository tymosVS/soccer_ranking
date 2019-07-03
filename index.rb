puts 'Введите имя файла'
file_name = gets.chomp

list_team = {}

fil_rd = File.open(file_name)

fil_rd.each do |line|
  line.strip!
  tmp = line.split(',') if line
  tmp1 = tmp[0].split(' ')
  tmp2 = tmp[1].split(' ')
  res1 = tmp1.pop.to_i
  res2 = tmp2.pop.to_i
  case res1 <=> res2
  when -1
    list_team.key?(tmp1.join) ? list_team[tmp1.join] += 0 : list_team[tmp1.join] = 0
    list_team.key?(tmp2.join) ? list_team[tmp2.join] += 3 : list_team[tmp2.join] = 3
  when 0
    list_team.key?(tmp1.join) ? list_team[tmp1.join] += 1 : list_team[tmp1.join] = 1
    list_team.key?(tmp2.join) ? list_team[tmp2.join] += 1 : list_team[tmp2.join] = 1
  when 1
    list_team.key?(tmp1.join) ? list_team[tmp1.join] += 3 : list_team[tmp1.join] = 3
    list_team.key?(tmp2.join) ? list_team[tmp2.join] += 0 : list_team[tmp2.join] = 0
  end

end
list_team = list_team.sort_by{|k, v| [-v, k]}
index = 0
list_team.each do |k, v|
  index += 1
  puts index.to_s + '.' + k.to_s + ' ' + v.to_s + ' pts'
end