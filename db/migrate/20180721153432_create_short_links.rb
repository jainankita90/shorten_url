class CreateShortLinks < ActiveRecord::Migration[5.2]

  def change
    create_table :short_links do |t|
      t.string :main_url
      t.string :sanitize_url
      t.integer :hit_count, default: 0
      t.string :slug
      t.date :expire_date
      t.timestamps
    end
  end
end
