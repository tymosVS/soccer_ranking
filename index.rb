# frozen_string_literal: true

require './soccer_ranking'

sm = SoccerModule::SoccerRanking.new
sm.read_file
sm.print_table
