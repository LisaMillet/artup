require "open-uri"
puts "Destroying everything"
Answer.destroy_all
Question.destroy_all
Piece.destroy_all
Journey.destroy_all
UserJourney.destroy_all
User.destroy_all

require "csv"
puts "Creating Pieces"
filepath = "#{Rails.root.join('db', 'pieces.csv')}"
# filepath = "/home/bourrm/code/LisaMillet/artup/db/pieces.csv"
file = File.read(filepath, encoding: 'bom|utf-8')

csv = CSV.parse(file, headers: :first_row, col_sep: ';')
csv.each do |row|
  piece = Piece.create!(name: row["name"], description: row["description"], status: row["status"])
  # photo attachment
  if row["image"]

    file = URI.open(row["image"])
    piece.photo.attach(io: file, filename: "#{piece.name}.png", content_type: "image/png")
    piece.save!
  end
end

filepath = "/home/bourrm/code/LisaMillet/artup/db/journeys.csv"
file = File.read(filepath, encoding: 'bom|utf-8')

csv = CSV.parse(file, headers: :first_row, col_sep: ';')
csv.each do |row|
  journey = Journey.create!(name: row["name"], description: row["description"])
  # photo attachment
  if row["image"]

    file = URI.open(row["image"])
    journey.photo.attach(io: file, filename: "#{journey.name}.png", content_type: "image/png")
    journey.save!
  end
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

user = User.create!(email: "bob@mail.com", password: "mdpmdp")
beyonce = Journey.find_by(name: "Parcours Beyonce & Jay Z")
Piece.all.each do |p|
  JourneyPiece.create!(piece: p, journey: beyonce)
end
# UserJourney.create!(user: user, journey: beyonce)
