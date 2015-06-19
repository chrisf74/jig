class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
    	t.integer :book_id
    	t.string  :resource
      t.string  :slug
      t.string  :name

      t.timestamps null: false
    end
  end
end
