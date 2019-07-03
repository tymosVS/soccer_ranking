list_team = {}

fil_rd = File.open('in.txt')

fil_rd.each do |line|
  tmp = line.split(',')
  tmp.each do |row|
    row.strip!
    if row
      tmp = row.split(' ')
      res = tmp.pop.to_i
      list_team.key?(tmp.join) ? list_team[tmp.join] += res : list_team[tmp.join] = res
    end
  end
end
list_team = list_team.sort_by{|k, v| [-v, k]}
index = 0
list_team.each do |k, v|
  index += 1
  puts index.to_s + '.' + k.to_s + ' ' + v.to_s + ' pts'
end