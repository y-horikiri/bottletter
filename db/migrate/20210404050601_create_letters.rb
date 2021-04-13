class CreateLetters < ActiveRecord::Migration[6.1]
  def change
    create_table :letters do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.boolean :repliable, null: false, default: false
      t.integer :reply_to
      t.boolean :twitter_attached, null: false, default: false

      t.timestamps
    end
  end
end
