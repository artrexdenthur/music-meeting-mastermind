class ChorusSerializer < ActiveModel::Serializer
  attributes :id, :name, :memberships

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
      custom_membership[:member] = m.singer.slice(
        :id,
        :name,
        :age,
        :description
      )
    end
  end
end
