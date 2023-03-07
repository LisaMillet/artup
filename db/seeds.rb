Answer.destroy_all
Question.destroy_all
Piece.destroy_all

require "csv"

filepath = "#{Rails.root.join('db', 'pieces.csv')}"
# filepath = "/home/bourrm/code/LisaMillet/artup/db/pieces.csv"
file = File.read(filepath, encoding: 'bom|utf-8')

csv = CSV.parse(file, headers: :first_row, col_sep: ';')
csv.first(1).each do |row|
  Piece.create!(row)
  # piece = Piece.create!(name: row["name"], description: row["description"])
  # photo attachment
end

filepath = "#{Rails.root.join('db', 'questions.csv')}"
# filepath = "/home/bourrm/code/LisaMillet/artup/db/pieces.csv"
file = File.read(filepath, encoding: 'bom|utf-8')

csv = CSV.parse(file, headers: :first_row, col_sep: ';')

csv.each do |row|
  piece = Piece.find_by(name: row["piece_name"])

  if piece
    question = Question.create!(content: row["question_content"], piece: piece)
    Answer.create!(content: row["answer_1_content"], question: question)
    Answer.create!(content: row["answer_2_content"], question: question)
    Answer.create!(content: row["answer_3_content"], question: question)
    Answer.create!(content: row["answer_4_content"], question: question)
    Answer.find_by(content: row["correct_answer"]).update(right_answer: true) if Answer.find_by(content: row["correct_answer"])
  end
end
