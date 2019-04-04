class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content
      t.text :comment
      t.references :user
      
      t.timestamps
    end
  end
end
