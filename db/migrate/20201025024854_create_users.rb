class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :name
      t.string :encrypted_password, null: false
      t.string :encrypted_password_iv, null: false

      t.timestamps
    end
  end
end
