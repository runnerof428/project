class AddGenreToSubmission < ActiveRecord::Migration[5.1]
  def change
    add_reference :submissions, :Genre, foreign_key: true
  end
end
