class CreateRestos < ActiveRecord::Migration[6.0]
  def change
    create_table :restos do |t|
      t.string :name
      t.string :location
      t.string :details
      t.text :image
      t.string :website
      t.boolean :online_delivery,default: false
      t.boolean :table_booking,default: false
      t.timestamps
    end
  end
end
