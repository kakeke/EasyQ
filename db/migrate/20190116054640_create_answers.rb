class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :answer
      t.string :ip
      t.integer :report, default: 0
      t.integer :question_id

      t.timestamps
    end
  end
end
