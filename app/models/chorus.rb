class Chorus < ApplicationRecord
  has_many :memberships
  has_many :members, through: :memberships, source: :singer
end
