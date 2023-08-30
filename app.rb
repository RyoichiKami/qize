require 'sinatra'

# クイズの問題と正解
quiz_data = [
  {
    question: "いむくんの誕生日はいつ？",
    choices: ["11/30", "11/16", "1/26"],
    answer: 2
  }
  {
    question: "HTMLは何の略ですか？",
    choices: ["Hyper Text Markup Language", "High Tech Modern Language", "How To Make Lasagna"],
    answer: 0
  },
  {
    question: "Rubyのファイル拡張子は何ですか？",
    choices: [".rb", ".html", ".js"],
    answer: 0
  }
]

get '/' do
  erb :index, locals: { quiz_data: quiz_data }
end

post '/check' do
  score = 0

  params.each do |question, answer|
    correct_answer = quiz_data[question.to_i][:answer]
    score += 1 if answer.to_i == correct_answer
  end

  erb :result, locals: { score: score, total_questions: quiz_data.length }
end
