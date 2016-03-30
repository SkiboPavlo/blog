class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.text :text
      t.string :header
      t.timestamps null: false
    end
  end
end
