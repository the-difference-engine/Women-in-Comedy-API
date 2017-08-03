# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(first_name: "Anthony", last_name: "Hawkins", email:"ahawkins@gmail.com", password:"password")

User.create(first_name: "DeMarcus", last_name: "Cousins", email:"dcousins@gmail.com", password:"password")

User.create(first_name: "Jim", last_name: "Sriracha", email:"jsriracha@gmail.com", password:"password")

User.create(first_name: "Halo", last_name: "Top", email:"htop@gmail.com", password:"password")

User.create(first_name: "Mochi", last_name: "Balls", email:"mballs@gmail.com", password:"password")

Event.create(
	host_id:2,
	title: "A Great Event",
	photo:"my pix",
	date:"4-16-98",
	ticket_link:"www.yahoo.com",
	about: "view my website yeahhhh"
)

Event.create(
	host_id:2,
	title: "A Wicked Event",
	photo:"my pix",
	date:"4-16-98",
	ticket_link:"www.yahoo.com",
	about: "view my website yeahhhh"
)


5.times do
	Event.create(
		host_id:1,
		title: "A Great Event",
		photo:"my pix",
		date:"7-16-2016",
		ticket_link:"www.google.com",
		about: "mine is bigger",
	)
end

Comment.create(
	commenter_id: 1,
	commentable_type: "Event",
	commentable_id: 1,
	body: "who is the best coder"
)

Comment.create(
	commenter_id: 1,
	commentable_type: "Event",
	commentable_id: 1,
	body: "to my class whats uppppp"
)

Post.create(
	user_id: 1,
	title: "comedy is the best",
	body: "come and have fun"
)

Post.create(
	user_id: 2,
	title: "Tonight!!!",
	body: "see all the women of comedy"
)

ConnectionRequest.create(
	sender_id:1,
	receiver_id: 2,
	status: "pending"
)

ConnectionRequest.create(
	sender_id:2,
	receiver_id: 1,
	status: "pending"
)

ConnectionRequest.create(
	sender_id:1,
	receiver_id: 2,
	status: "pending"
)

ConnectionRequest.create(
	sender_id:1,
	receiver_id: 3,
	status: "pending"
)
ConnectionRequest.create(
	sender_id:3,
	receiver_id: 1,
	status: "pending"
)

ConnectionRequest.create(
	sender_id:2,
	receiver_id: 4,
	status: "pending"
)
ConnectionRequest.create(
	sender_id:4,
	receiver_id: 2,
	status: "pending"
)
