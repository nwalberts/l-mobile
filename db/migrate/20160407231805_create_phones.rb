class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :manufacturer, null: false
      t.string :size, null: false
      t.belongs_to :operating_system, null: false
      t.string :model, null: false
      t.string :charging_port, null: false
      t.integer :quantity

      t.timestamps
    end
  end
end
