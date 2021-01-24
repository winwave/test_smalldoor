class CreateProcedureMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :procedure_memberships do |t|
      t.references :procedure, null: false
      t.references :membership_plan, null: false
      t.integer :times

      t.timestamps
    end

    add_index :procedure_memberships, [:procedure_id, :membership_plan_id], unique: true, name: 'index_procedure_memberships'
  end
end
