class AddAuthTokenToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :refresh_token, :string
  end

  def down
    remove_column :users, :refresh_token, :string
  end
end
