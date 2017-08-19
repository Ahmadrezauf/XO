class Board < ApplicationRecord
  validates_presence_of :game_sts
  validates_numericality_of :winner

  def as_json
    ###
  end
end
