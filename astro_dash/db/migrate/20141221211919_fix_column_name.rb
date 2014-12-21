class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :content_pages, :type, :category
  end
end
