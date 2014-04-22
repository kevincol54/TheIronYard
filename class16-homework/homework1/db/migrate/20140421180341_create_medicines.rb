class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.string :name
      t.string :strength
      t.integer :hospital_id

      t.timestamps
    end
  end
end
