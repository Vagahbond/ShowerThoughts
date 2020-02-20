class CreateTaggeds < ActiveRecord::Migration[6.0]
  def change
    create_table :taggeds do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :showerthought, null: false, foreign_key: true

      t.timestamps
    end
  end
end
