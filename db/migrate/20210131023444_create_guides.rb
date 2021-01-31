class CreateGuides < ActiveRecord::Migration[6.0]
  def change
    create_table :guides do |t|
      t.string :title,    null: false
      t.text :content,    null: false
      t.text :notice
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
