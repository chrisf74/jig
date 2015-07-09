class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
    	t.string  :book_slug
      t.integer :book_id
      t.string  :slug
      t.string  :name

      t.timestamps null: false
    end
  end
end
