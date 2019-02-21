# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

# ApplicationRecord.connection.reset_pk_sequence!('users')
# ApplicationRecord.connection.reset_pk_sequence!('polls')
# ApplicationRecord.connection.reset_pk_sequence!('questions')
# ApplicationRecord.connection.reset_pk_sequence!('answer_choices')
# ApplicationRecord.connection.reset_pk_sequence!('responses')


user = User.create!(username: 'skeiron')
user2 = User.create!(username: 'hogarth')
poll = Poll.create!(author_id: user.id, title: 'Food and Gluttony')
question = Question.create!(text: 'How many hamburgers are too much?', poll_id: poll.id)
question2 = Question.create!(text: 'How many pizza are too much?',poll_id: poll.id)
answer_choice = AnswerChoice.create!(question_id: question.id, text: "Never!!!!!")
answer_choice2 = AnswerChoice.create!(question_id: question2.id, text: "yes! go vegan")
response = Response.create!(respondent_id: user2.id, answer_choice_id: answer_choice.id)
response2 = Response.create!(respondent_id: user.id, answer_choice_id: answer_choice2.id)