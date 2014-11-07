class ConsoleGame < ActiveRecord::Base
  belongs_to :console
  belongs_to :game
end
