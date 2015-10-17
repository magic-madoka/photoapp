class AddFullNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name,      :string, default: ''
    add_column :users, :last_name, :string, default: ''
  end
end
