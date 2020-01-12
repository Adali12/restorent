class CreateBreakFasts < ActiveRecord::Migration[6.0]
  def change
    create_table :break_fasts do |t|
      t.string :item
      t.integer :price
      t.references :resto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
