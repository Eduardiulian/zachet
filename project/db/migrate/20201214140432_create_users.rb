class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :username
      t.text :password_digest
      t.text :email
      t.text :headline
      t.text :tube_description
      t.text :link

      t.timestamps
    end
  end
end
