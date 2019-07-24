class SingerSerializer < ActiveModel::Serializer
  attributes :id, :name, :preferred_voice_part, :age, :description, :memberships
  # has_many :memberships, serializer: SingerMembershipSerializer
  def memberships
    custom_memberships = []
    object.memberships.each do |m|
      custom_membership = m.slice(
        :id, 
        :baritone, 
        :bass, 
        :lead,
        :tenor
      )
      custom_membership[:chorus] = {
        id: m.chorus.id,
        name: m.chorus.name
      }
      custom_memberships << custom_membership
    end
    return custom_memberships
  end
end
