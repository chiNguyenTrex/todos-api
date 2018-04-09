class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :todo, foreign_key: true
      t.string :name
      t.boolean :done, default: false

      t.timestamps
    end
  end
end
