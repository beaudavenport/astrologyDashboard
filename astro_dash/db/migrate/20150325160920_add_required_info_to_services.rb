class AddRequiredInfoToServices < ActiveRecord::Migration
  def change
    add_column :services, :required_info, :text
  end
end
