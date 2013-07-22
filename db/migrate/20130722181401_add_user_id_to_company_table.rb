class AddUserIdToCompanyTable < ActiveRecord::Migration
  def up
    Company.destroy_all
    add_column :companies, :user_id, :integer
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end