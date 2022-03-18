class CreateTranslations < ActiveRecord::Migration[6.1]
  def change
    create_table :translations do |t|
      t.string :name
      t.string :description
      t.integer :item_id

      t.timestamps
    end
  end
end
