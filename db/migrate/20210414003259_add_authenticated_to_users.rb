class AddAuthenticatedToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :authenticated, :boolean
  end
end
