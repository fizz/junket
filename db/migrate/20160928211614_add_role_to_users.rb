class AddRoleToUsers < ActiveRecord::Migration[5.0]
  def up
    create_enum :role, :guest, :host, :admin, :vip
    add_column :users, :role, :role
  end

  def down
    drop_enum :role
    remove_column :users, :role
  end
end
