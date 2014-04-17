class AddFieldsToDvds < ActiveRecord::Migration
  def change
    add_column :dvds, :rating, :string
    add_column :dvds, :director, :string
    add_column :dvds, :release_date, :string
    add_column :dvds, :genre, :string
    add_column :dvds, :length, :string
    add_column :dvds, :description, :text
    add_column :dvds, :good_movie, :string
  end
end


