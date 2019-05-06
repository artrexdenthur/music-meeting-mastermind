class Chorus < ApplicationRecord
  has_many :memberships
  has_many :singers, through: :memberships
end
