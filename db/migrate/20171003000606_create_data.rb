class CreateData < ActiveRecord::Migration[5.1]
  def change
    create_table :data do |t|
      t.references :box, foreign_key: true
      t.string :identifier
      t.jsonb :payload

      t.timestamps
    end
    add_index :data, :identifier, unique: true
  end
end
