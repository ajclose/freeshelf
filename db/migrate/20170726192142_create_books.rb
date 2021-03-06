class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.string :description, null: false
      t.string :link, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
