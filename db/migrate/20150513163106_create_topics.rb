class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :slug
      t.string :name
      t.string :content

      t.timestamps null: false
    end
  end
end
