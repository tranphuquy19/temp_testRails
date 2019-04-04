class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :level, null: false
      t.text :content, null: false
      t.references :category
      t.references :user
      t.timestamps
    end

    add_index :questions, :level
  end
end
