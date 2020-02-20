class CreateThumbs < ActiveRecord::Migration[6.0]
  def change
    create_table :thumbs do |t|
      t.boolean :direction
      t.references :user, null: false, foreign_key: true
      t.references :showerthought, null: false, foreign_key: true

      t.timestamps
    end
  end
end
