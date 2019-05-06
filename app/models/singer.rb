class Singer < ApplicationRecord
  has_many :memberships
  has_many :choruses, through: :memberships
end
