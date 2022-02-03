# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Vocabulary.create(english: 'receptionist', chinese: '接待員', error_times: 0)
Vocabulary.create(english: 'spectator', chinese: '參觀者', error_times: 1)
Vocabulary.create(english: 'novice', chinese: '初學者', error_times: 2)
