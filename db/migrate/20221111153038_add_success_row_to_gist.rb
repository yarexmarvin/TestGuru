class AddSuccessRowToGist < ActiveRecord::Migration[6.1]
  def change
    add_column :gists, :success, :boolean
  end
end
