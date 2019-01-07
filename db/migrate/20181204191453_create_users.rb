class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :text
      t.string :password
      t.string :password

      t.timestamps
    end
  end
end
