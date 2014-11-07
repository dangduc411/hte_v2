class Game < ActiveRecord::Base
  mount_uploader :poster, ::PosterUploader

  has_many :console_games
  has_many :consoles, :through => :console_games

  validates :name, :poster, presence: true

  scope :disc, -> { where(disc: true) }
end
