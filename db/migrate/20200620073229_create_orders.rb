class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id , null: false
      t.integer :order_status , null: false ,default: 0
      t.integer :paying_method , null: false,default: 0
      t.integer :paying_sum, null: false
      t.integer :postage, null: false
      t.string :add_number, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.timestamps
    end
  end
end


