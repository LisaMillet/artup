Answer.destroy_all
Question.destroy_all
Piece.destroy_all

require "csv"

filepath = "#{Rails.root.join('db', 'pieces.csv')}"
# filepath = "/home/bourrm/code/LisaMillet/artup/db/pieces.csv"
file = File.read(filepath, encoding: 'bom|utf-8')

csv = CSV.parse(file, headers: :first_row, col_sep: ';')
csv.each do |row|
  piece = Piece.create!(name: row["name"], description: row["description"])
  # photo attachment
end

filepath = "#{Rails.root.join('db', 'questions.csv')}"
# filepath = "/home/bourrm/code/LisaMillet/artup/db/pieces.csv"
file = File.read(filepath, encoding: 'bom|utf-8')

csv = CSV.parse(file, headers: :first_row, col_sep: ';')
csv.each do |row|
  piece = Piece.find_by(name: row["piece_name"])
  question = Question.create!(content: row["question_content"], piece_id: piece.id)
  Answer.create!(content: row["answer_1_content"], question_id: question.id)
  Answer.create!(content: row["answer_2_content"], question_id: question.id)
  Answer.create!(content: row["answer_3_content"], question_id: question.id)
  Answer.create!(content: row["answer_4_content"], question_id: question.id)
end

user = User.create!(email: "bob@mail.com", password: "mdpmdp")
journey = Journey.create!(name: "beyonce", discount: 20)
Piece.all.each do |p|
  JourneyPiece.create!(piece: p, journey: journey)
end
UserJourney.create!(user: user, journey: journey)
