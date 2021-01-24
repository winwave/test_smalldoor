class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.datetime :membership_start_date
      t.datetime :membership_end_date

      t.timestamps
    end
  end
end
