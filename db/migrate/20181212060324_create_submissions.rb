class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.text :title
      t.text :content
      t.references :User, foreign_key: true

      t.timestamps
    end
  end
end
