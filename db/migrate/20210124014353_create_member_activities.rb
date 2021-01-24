class CreateMemberActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :member_activities do |t|
      t.references :member, null: false
      t.references :procedure, null: false
      t.timestamps
    end
  end
end
