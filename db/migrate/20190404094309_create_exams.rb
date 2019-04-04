class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.string :title
      t.integer :time_remaining
      t.text :list_questions
      t.references :category
      t.references :user

      t.timestamps
    end
  end
end
