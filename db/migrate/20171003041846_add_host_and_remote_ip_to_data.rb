class AddHostAndRemoteIpToData < ActiveRecord::Migration[5.1]
  def change
    add_column :data, :host, :string
    add_column :data, :ip_address, :inet
  end
end
