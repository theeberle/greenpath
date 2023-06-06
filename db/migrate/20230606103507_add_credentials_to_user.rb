class AddCredentialsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :age_range, :integer
    add_column :users, :city, :string
    add_column :users, :profile_description, :text
    add_column :users, :carbon_count, :float
  end
end
