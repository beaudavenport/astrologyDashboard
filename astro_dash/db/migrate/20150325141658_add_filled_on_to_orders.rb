class AddFilledOnToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :filled_on, :date
  end
end
