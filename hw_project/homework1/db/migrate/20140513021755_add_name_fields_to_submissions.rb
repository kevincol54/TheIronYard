class AddNameFieldsToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :user_name, :string
  end
end
