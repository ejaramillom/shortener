class CreateUrls < ActiveRecord::Migration[7.2]
  def change
    create_table :urls do |t|
      t.string :original_url
      t.string :shortened_url
      t.string :title_url
      t.integer :counter, default: 0

      t.timestamps
    end

    add_index :urls, :shortened_url, unique: true
    add_index :urls, :original_url, unique: true
  end
end
