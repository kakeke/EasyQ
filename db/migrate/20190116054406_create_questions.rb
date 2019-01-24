class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :target
      t.string :question
      t.string :question_image
      t.datetime :question_day
      t.integer :user_id
      t.string :token
      
      t.timestamps
    end
  end
end
