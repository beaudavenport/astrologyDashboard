class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :email
      t.string :confirmation
      t.string :receipt_number
      t.datetime :birth_date_time
      t.string :birth_place
      t.references :service, index: true

      t.timestamps
    end
  end
end
