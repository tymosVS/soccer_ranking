# frozen_string_literal: true

# module for prepare file witch match results
module SoccerModule
  # class for prepare results
  class SoccerRanking
    attr_accessor :file_name, :list_team, :file
    def initialize
      @list_team = {}
    end

    def filename
      puts 'Введите имя файла'
      @file_name = gets.chomp
    end

    private

    def open_file
      @file = File.open(@file_name)
    end

    def sort_by_ranking
      @list_team = @list_team.sort_by { |k, v| [-v, k] }
    end

    def insert_team_result(team, value)
      if @list_team.key?(team)
        @list_team[team] += value
      else
        @list_team[team] = value
      end
    end

    def insert_match_result(team, value, team1, value1)
      insert_team_result(team, value)
      insert_team_result(team1, value1)
    end

    def prepare_result(res_compare, team1, team2)
      case res_compare
      when -1
        insert_match_result(team1, 0, team2, 3)
      when 0
        insert_match_result(team1, 1, team2, 1)
      when 1
        insert_match_result(team1, 3, team2, 0)
      end
    end

    def prepare_read_line(line)
      line.strip!
      current_math = line.split(',') if line
      team1 = current_math[0].split(' ')
      team2 = current_math[1].split(' ')
      res1 = team1.pop.to_i
      res2 = team2.pop.to_i
      team1_name = team1.join(' ')
      team2_name = team2.join(' ')
      [team1_name, res1, team2_name, res2]
    end

    public

    def read_file
      open_file
      @file.each do |line|
        current_res = prepare_read_line(line)
        compare_result = current_res[1] <=> current_res[3]
        prepare_result(compare_result, current_res[0], current_res[2])
      end
      sort_by_ranking
    end

    def print_table
      index = 0
      list_team.each do |k, v|
        index += 1
        puts index.to_s + '.' + k.to_s + ' ' + v.to_s + ' pts'
      end
    end
  end
end
