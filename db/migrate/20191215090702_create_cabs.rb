class CreateCabs < ActiveRecord::Migration[6.0]
  def change
    create_table :cabs do |t|
      t.string :name
      t.string :latitude
      t.string :longitude
      t.string :color

      t.timestamps
    end
  end
end
