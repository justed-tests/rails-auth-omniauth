# lala la
class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :provider, default: ''
      t.string :uid, default: ''
      t.string :name, default: ''
      t.string :location, default: ''
      t.string :image_url, default: ''
      t.string :url, default: ''

      t.timestamps
    end

    add_index :users, :provider
    add_index :users, :uid

    add_index :users, [:provider, :uid], unique: true
  end
end
