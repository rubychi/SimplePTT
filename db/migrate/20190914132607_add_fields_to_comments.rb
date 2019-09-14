class AddFieldsToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :content, :text
    add_column :comments, :like, :boolean
    add_column :comments, :dislike, :boolean
    add_column :comments, :user_id, :integer
    add_column :comments, :post_id, :integer
  end
end
