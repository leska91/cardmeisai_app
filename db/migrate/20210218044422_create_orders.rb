class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.date :date,            null: false
      t.integer :amount,       null: false
      t.integer :category_id,  null: false
      t.string :memo
      t.timestamps
    end
  end
end
