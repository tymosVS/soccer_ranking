# frozen_string_literal: true

# run preparing file
module RunModule
  require './soccer_ranking'
  def self.run
    sm = SoccerModule::SoccerRanking.new
    ARGV.size.positive? ? sm.file_name = ARGV[0] : sm.filename
    sm.read_file
    sm.print_table
  end
end

RunModule.run
