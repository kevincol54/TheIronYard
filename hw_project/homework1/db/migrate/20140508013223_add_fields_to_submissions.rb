class AddFieldsToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :name, :string
  end
end
