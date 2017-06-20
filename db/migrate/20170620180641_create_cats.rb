class CreateCats < ActiveRecord::Migration[5.0]
  def change
    create_table :cats do |t|
      t.date :birthdate, null: false
      t.text :color, null: false
      t.text :name, null: false
      t.text :sex, null: false, limit: 1
      t.text :description, null: false

      t.timestamps
    end
  end
end
