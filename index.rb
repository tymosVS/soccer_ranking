# frozen_string_literal: true

require './soccer_ranking'
require 'thor'

# run app from CLI
class SoccerCLI < Thor
  desc 'prepare FILENAME', 'run handling file and print results'
  def prepare(filename)
    sm = SoccerModule::SoccerRanking.new
    sm.file_name = filename
    sm.read_file
    sm.print_table
  end
end

SoccerCLI.start(ARGV)
