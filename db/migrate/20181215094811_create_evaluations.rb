class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.references :User, foreign_key: true
      t.references :Submission, foreign_key: true

      t.timestamps
    end
  end
end
