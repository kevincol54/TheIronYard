class AddFieldsToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :discussion_type, :string
  end
end
