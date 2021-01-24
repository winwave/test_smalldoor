class CreateMembershipPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :membership_plans do |t|
      t.string :name
    end
  end
end
