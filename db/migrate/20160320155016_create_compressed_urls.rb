class CreateCompressedUrls < ActiveRecord::Migration
  def change
    create_table :compressed_urls do |t|
      t.string :origin_url
      t.string :name
      t.timestamps null: false
    end
  end
end
