# frozen_string_literal: true

require './soccer_ranking'
require 'thor'

class MyCLI < Thor
  desc "prepare 'filename'", "run prepare file and print results"
  def prepare(filename)
    sm = SoccerModule::SoccerRanking.new
    ARGV.size.positive? ? sm.file_name = filename : sm.filename
    sm.read_file
    sm.print_table
  end
end

MyCLI.start(ARGV)
