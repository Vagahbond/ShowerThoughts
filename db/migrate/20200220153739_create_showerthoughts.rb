class CreateShowerthoughts < ActiveRecord::Migration[6.0]
  def change
    create_table :showerthoughts do |t|
      t.string :content
      t.string :context
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
