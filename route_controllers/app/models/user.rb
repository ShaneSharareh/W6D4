# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks, dependant: :destroy,
    foreign_key: :artist_id,
    class_name: :Artwork

  has_many :artwork_views, dependant: :destroy,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare

    has_many :shared_artworks, dependant: :destroy,
      through: :artwork_views,
      source: :artwork
end
