class Chorus < ApplicationRecord
  has_many :memberships
  has_many :members, through: :memberships, source: :singer
  has_many :leads, -> {leads.distinct}, through: :memberships, source: :singer # '->' adds a scope to the association
  belongs_to :user # either this to designate owner, or a chorus_role join model to designate who has modify permissions on the chorus

  def self.leads
    joins(:memberships).where(memberships: {lead: true})
  end
  
end
