class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :login, null: false
      t.string :password, null: false
      t.string :type, null: false, default: 'user'

      t.timestamps
    end
  end
end
