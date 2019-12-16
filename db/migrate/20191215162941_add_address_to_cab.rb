class AddAddressToCab < ActiveRecord::Migration[6.0]
  def change
    add_column :cabs, :address, :string
  end
end
