# frozen_string_literal: true

require './soccer_ranking'

sm = SoccerModule::SoccerRanking.new
ARGV.size.positive? ? sm.file_name = ARGV[0] : sm.filename
sm.read_file
sm.print_table
