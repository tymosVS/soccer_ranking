# frozen_string_literal: true

# module for prepare file witch match results
module SoccerModule
  class SoccerRanking
    attr_accessor :file_name, :list_team, :file
    def initialize
      @list_team = {}
    end

    private

    def filename
      puts 'Введите имя файла'
      @file_name = gets.chomp
      @file_name
    end

    def open_file
      @file = File.open(filename)
    end

    def sort_by_ranking
      @list_team = @list_team.sort_by { |k, v| [-v, k] }
    end

    @insert_result = lambda do |team, value|
      @list_team.key?(team) ? @list_team[team] += value : @list_team[team] = value
    end

    def prepare_result(res_compare, team1, team2)
      case res_compare
      when -1
        @list_team.key?(team1) ? @list_team[team1] += 0 : @list_team[team1] = 0
        @list_team.key?(team2) ? @list_team[team2] += 3 : @list_team[team2] = 3
      when 0
        @list_team.key?(team1) ? @list_team[team1] += 1 : @list_team[team1] = 1
        @list_team.key?(team2) ? @list_team[team2] += 1 : @list_team[team2] = 1
      when 1
        @list_team.key?(team1) ? @list_team[team1] += 3 : @list_team[team1] = 3
        @list_team.key?(team2) ? @list_team[team2] += 0 : @list_team[team2] = 0
      end
    end

    public

    def read_file
      open_file
      @file.each do |line|
        line.strip!
        tmp = line.split(',') if line
        tmp1 = tmp[0].split(' ')
        tmp2 = tmp[1].split(' ')
        res1 = tmp1.pop.to_i
        res2 = tmp2.pop.to_i
        prepare_result(res1 <=> res2, tmp1.join(' '), tmp2.join(' '))
      end
    end

    def print_table
      sort_by_ranking
      index = 0
      list_team.each do |k, v|
        index += 1
        puts index.to_s + '.' + k.to_s + ' ' + v.to_s + ' pts'
      end
    end
  end
end
