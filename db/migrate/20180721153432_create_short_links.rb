class CreateShortLinks < ActiveRecord::Migration[5.2]
  CREATE_TIMESTAMP = 'DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP'

  def change
    create_table :short_links do |t|
      t.string :main_url
      t.string :sanitize_url
      t.string :hit_count, default: 0
      t.string :slug
      t.date :expire_date, default: -> { 'now()' }
      t.timestamps
    end
  end
end
