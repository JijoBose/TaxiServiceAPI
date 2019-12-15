class CreateCabs < ActiveRecord::Migration[6.0]
  def change
    create_table :cabs do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :color

      t.timestamps
    end
  end
end
