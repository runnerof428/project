class CreateGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :genres do |t|
      t.text :genre
      t.references :Subject, foreign_key: true

      t.timestamps
    end
  end
end
