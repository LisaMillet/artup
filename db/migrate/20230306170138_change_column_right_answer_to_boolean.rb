class ChangeColumnRightAnswerToBoolean < ActiveRecord::Migration[7.0]
  def change
    remove_column :answers, :right_answer
    add_column :answers, :right_answer, :boolean, default: false
  end
end
