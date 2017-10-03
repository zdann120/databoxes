class AddJwtEncryptionKeyToBoxes < ActiveRecord::Migration[5.1]
  def change
    add_column :boxes, :jwt_key, :string
    add_index :boxes, :jwt_key, unique: true
  end
end
