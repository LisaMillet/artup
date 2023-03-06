class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true
      t.text :right_answer
      t.text :content
      t.integer :points

      t.timestamps
    end
  end
end
