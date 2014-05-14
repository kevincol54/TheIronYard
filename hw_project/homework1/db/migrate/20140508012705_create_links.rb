class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
        t.string :links
      t.timestamps
    end
  end
end
