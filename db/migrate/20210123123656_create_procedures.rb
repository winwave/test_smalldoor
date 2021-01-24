class CreateProcedures < ActiveRecord::Migration[6.0]
  def change
    create_table :procedures do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
    end
  end
end
