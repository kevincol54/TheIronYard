class CreateHospitals < ActiveRecord::Migration
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :location
      t.text :description
      t.timestamps
    end
  end
end
