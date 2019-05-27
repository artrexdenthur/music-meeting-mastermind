class Membership < ApplicationRecord
  belongs_to :singer
  belongs_to :chorus

end
