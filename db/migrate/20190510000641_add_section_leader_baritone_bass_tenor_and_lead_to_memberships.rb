class AddSectionLeaderBaritoneBassTenorAndLeadToMemberships < ActiveRecord::Migration[5.2]
  def change
    add_column :memberships, :section_leader, :boolean    
    add_column :memberships, :baritone, :boolean
    add_column :memberships, :bass, :boolean
    add_column :memberships, :lead, :boolean
    add_column :memberships, :tenor, :boolean
  end
end
