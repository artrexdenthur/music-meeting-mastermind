class MembershipSerializer < ActiveModel::Serializer
  attributes :id, :baritone, :bass, :lead, :tenor
  belongs_to :singer
  belongs_to :chorus
end
