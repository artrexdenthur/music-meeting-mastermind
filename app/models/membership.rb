class Membership < ApplicationRecord
  belongs_to :singer
  belongs_to :chorus
  validate :has_a_voice_part

  def has_a_voice_part
    unless baritone || bass || tenor || lead
      errors.add(:base, "Must have at least one voice part")
    end
  end
end


