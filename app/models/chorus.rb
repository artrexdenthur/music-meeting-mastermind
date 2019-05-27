class Chorus < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :singer
  has_many :leads, -> {leads.distinct}, through: :memberships, source: :singer # '->' adds a scope to the association
  has_many :basses, -> {basses.distinct}, through: :memberships, source: :singer # '->' adds a scope to the association
  has_many :baritones, -> {baritones.distinct}, through: :memberships, source: :singer # '->' adds a scope to the association
  has_many :tenors, -> {tenors.distinct}, through: :memberships, source: :singer # '->' adds a scope to the association
  belongs_to :user # either this to designate owner, or a chorus_role join model to designate who has modify permissions on the chorus

  def self.leads
    joins(:memberships).where(memberships: {lead: true})
  end
  
  def self.basses
    joins(:memberships).where(memberships: {bass: true})
  end
  
  def self.baritones
    joins(:memberships).where(memberships: {baritone: true})
  end

  def self.tenors
    joins(:memberships).where(memberships: {tenor: true})
  end
end
