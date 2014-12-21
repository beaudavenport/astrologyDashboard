class AddTypeToContentPages < ActiveRecord::Migration
  def change
    add_column :content_pages, :type, :string
  end
end
