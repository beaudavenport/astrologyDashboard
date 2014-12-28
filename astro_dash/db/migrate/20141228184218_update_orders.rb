class UpdateOrders < ActiveRecord::Migration
  def change
    drop_table :orders
    create_table :orders do |t|
      t.text :notification_params 
      t.string :status 
      t.string :transaction_id
      t.datetime :purchased_at
      t.string :email
      t.string :customer
      t.text :customer_info
      t.references :service, index: true

      t.timestamps
    end
  end
end
