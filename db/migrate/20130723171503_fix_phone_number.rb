class FixPhoneNumber < ActiveRecord::Migration
  def up
    PhoneNumber.destroy_all
    remove_column :phone_numbers, :number
    add_column :phone_numbers, :number, :string
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end