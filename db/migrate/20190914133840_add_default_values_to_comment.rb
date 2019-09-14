class AddDefaultValuesToComment < ActiveRecord::Migration[6.0]
  def change
    change_column_default :comments, :like, false
    change_column_default :comments, :dislike, :false
  end
end
