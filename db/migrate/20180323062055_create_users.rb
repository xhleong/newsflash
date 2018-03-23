class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email
      t.boolean :admin


      # authentications
      t.string :password_digest
      t.timestamps
    end
  end
end
