class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :genre, foreign_key: true
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.boolean :is_active, null: false,default: false

      t.timestamps
    end
  end
end
