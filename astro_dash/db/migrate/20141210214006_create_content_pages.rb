class CreateContentPages < ActiveRecord::Migration
  def change
    create_table :content_pages do |t|
      t.string :heading
      t.text :body

      t.timestamps
    end
  end
end
