class AddUserIdToPersonTable < ActiveRecord::Migration
  def up
    Person.destroy_all
    add_column :people, :user_id, :integer
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end