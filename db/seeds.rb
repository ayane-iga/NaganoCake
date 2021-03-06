# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8


Admin.create!(
	email: "a@a",
	password: "igasaki"
	)

Genre.create(
	name: "ケーキ"
	)
Genre.create(
	name: "焼き菓子"
	)
Genre.create(
	name: "チョコレート")

Item.create!(
	name: "いちごのショートケーキ",
	text: "いちごがたくさんある",
	is_valid: true,
	tax_free_price: "350",
	genre_id: 1
	 )
Item.create!(
	name: "チョコレート",
	text: "ビターです",
	is_valid: true,
	tax_free_price: "500",
	genre_id: 3
	)
