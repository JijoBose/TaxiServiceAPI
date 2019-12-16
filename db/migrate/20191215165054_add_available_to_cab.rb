class AddAvailableToCab < ActiveRecord::Migration[6.0]
  def change
    add_column :cabs, :available, :boolean, default: false
  end
end
