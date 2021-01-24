class AddMembershipPlanToMembers < ActiveRecord::Migration[6.0]
  def change
    add_reference :members, :membership_plans, foreign_key: true
  end
end
