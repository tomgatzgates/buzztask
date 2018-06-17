class AddTokenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :api_token, :string, index: true, unique: true
  end
end
