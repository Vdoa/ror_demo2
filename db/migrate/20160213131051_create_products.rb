class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |table|
      table.integer :price
      table.string :name
      table.text :description

      table.timestamps null: false
    end
  end
end
