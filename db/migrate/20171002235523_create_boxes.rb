class CreateBoxes < ActiveRecord::Migration[5.1]
  def change
    create_table :boxes do |t|
      t.string :token
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.boolean :public

      t.timestamps
    end
    add_index :boxes, :token, unique: true
  end
end
