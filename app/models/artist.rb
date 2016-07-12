class Artist < ActiveRecord::Base
  has_many :albums
  has_many :genres, through: :albums

  belongs_to :manager
end
