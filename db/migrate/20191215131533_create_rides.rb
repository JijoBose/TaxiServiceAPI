class CreateRides < ActiveRecord::Migration[6.0]
  def change
    create_table :rides do |t|
      t.integer :customer_id
      t.integer :cab_id
      t.string :source
      t.string :destination
      t.float :cost
      t.boolean :completed, :boolean, default: false

      t.timestamps
    end
  end
end
