class Singer < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :choruses, through: :memberships, inverse_of: :members
  belongs_to :user, optional: true
  accepts_nested_attributes_for :memberships, reject_if: lambda { |a| a["chorus_id"].blank? }
  validates_format_of :name, :with => /\A[^0-9`!@#\$%\^&*+_=]{3,}\z/
  # Singer joins membership where lleadsead == true

  # chorus1.memberships.bass => collection proxy of all bass memberships in the chorus?
  # multiple scope methods? 
  # (tangentially, has_many can have a block that you can call specifically)
  # most likely would need
  def self.leads
    joins(:memberships).where(memberships: {lead: true})
  end

  def self.basses
    joins(:memberships).where(memberships: {bass: true})
  end
end
