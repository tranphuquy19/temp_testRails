class CreateTestPapers < ActiveRecord::Migration[5.2]
  def change
    create_table :test_papers do |t|
      t.text :content
      t.integer :point
      t.references :exam, foreign_key: true
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
