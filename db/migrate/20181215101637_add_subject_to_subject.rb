class AddSubjectToSubject < ActiveRecord::Migration[5.1]
  def change
    add_column :subjects, :subject, :text
  end
end
