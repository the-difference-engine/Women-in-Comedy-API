# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(first_name: "Calvin", last_name: "Chan", email:"mrcalvinkc@gmail.com", password:"password", city: "san francisco", about:"I like apples", gender: 'male', confirmed_at: '2017-10-17 02:26:15.130453', admin: false, superadmin: false, public_figure: false, is_mentor: false, training: 'less than 1 year', experience: '1-3 years')

User.create(first_name: "DeMarcus", last_name: "Cousins", email:"dcousins@gmail.com", password:"password", city: "san francisco", about:"I like apples", gender: 'male', confirmed_at: '2017-10-17 02:26:15.130453', admin: false, superadmin: false, public_figure: false, is_mentor: false, training: '4-7 years', experience: '11+ years')

User.create(first_name: "Thor", last_name: "God of Thunder", email:"iamthor@gmail.com", password:"password", city: "Asgard", about:"I like to put the hammer down!", gender: 'male', confirmed_at: '2017-10-17 02:36:15.130453', admin: true, superadmin: true, public_figure: false, is_mentor: false, training: '4-7 years', experience: '11+ years')

User.create(first_name: "Jim", last_name: "Sriracha", email:"jsriracha@gmail.com", password:"password", city: "Chicago", about:"I like apples", gender: 'male', confirmed_at: '2017-10-17 02:26:15.130453', admin: false, superadmin: false, public_figure: false, is_mentor: false, training: '7-10 years', experience: '11+ years')

User.create(first_name: "Halo", last_name: "Top", email:"htop@gmail.com", password:"password", city: "san francisco", about:"I like apples", gender: 'male', confirmed_at: '2017-10-17 02:26:15.130453', admin: false, superadmin: false, public_figure: false, is_mentor: false, training: '1-3 years', experience: '4-7 years')

User.create(first_name: "Mochi", last_name: "Balls", email:"mballs@gmail.com", password:"password", city: "chicago", about:"I like apples", gender: 'male', confirmed_at: '2017-10-17 02:26:15.130453', admin: true, superadmin: false, public_figure: false, is_mentor: false, training: 'less than 1 year', experience: '1-3 years')

User.create(first_name: "Christina", last_name: "Durant", email:"cdurant@gmail.com", password:"password", city: "san francisco", about:"I like apples", gender: 'female', confirmed_at: '2017-10-17 02:26:15.130453', admin: false, superadmin: false, public_figure: false, is_mentor: false, training: '4-7 years', experience: '1-3 years')

User.create(first_name: "Luna", last_name: "Hassen", email:"luna@gmail.com", password:"password", city: "san francisco", about:"I like apples", gender: 'female', confirmed_at: '2017-10-17 02:26:15.130453', admin: true, superadmin: false, public_figure: false, is_mentor: false, training: 'less than 1 year', experience: '1-3 years')

User.create(first_name: "David", last_name: "Taylor", email:"david@gmail.com", password:"password", city: "bay area", about:"I like apples", gender: 'male', confirmed_at: '2017-10-17 02:26:15.130453', admin: false, superadmin: false, public_figure: false, is_mentor: false, training: '7-10 years', experience: '1-3 years')

User.create(first_name: "Marry", last_name: "Hoya", email:"marry@gmail.com", password:"password", city: "oakland", about:"I like apples", gender: 'female', confirmed_at: '2017-10-17 02:26:15.130453', admin: false, superadmin: false, public_figure: false, is_mentor: false, training: 'less than 1 year', experience: '1-3 years')

User.create(first_name: "James", last_name: "Rothschild", email:"jr@gmail.com", password:"password", city: "chicago", about:"I like apples", gender: 'male', confirmed_at: '2017-10-17 02:26:15.130453', admin: true, superadmin: false, public_figure: false, is_mentor: false, training: '11+ years', experience: '11+ years')

User.create(first_name: "Lizzie", last_name: "B", email:"lizziebennet@gmail.com", password:"password", city: "chicago", about:"I like apples", gender: 'male', confirmed_at: '2017-10-17 02:26:15.130453', admin: true, superadmin: true, training: 'less than 1 year', experience: '1-3 years', username: 'lbennet')

User.create(first_name: "Monroe", last_name: "C", email:"monroec@gmail.com", password:"password", city: "san francisco", about:"I like apples", gender: 'male', confirmed_at: '2017-10-17 02:26:15.130453', admin: true, superadmin: true, training: 'less than 1 year', experience: '1-3 years', username: 'cmonroe')

MeetOption.create(name: "Coffee")
MeetOption.create(name: "Feedback/Advice")
MeetOption.create(name: "Mentorship")
MeetOption.create(name: "New Friends In Comedy")
MeetOption.create(name: "Open Mic Buddy")
MeetOption.create(name: "Seeking Mentors")

Event.create(
	user_id:2,
	title: "A Great Event",
	photo:"https://ak0.picdn.net/shutterstock/videos/11618780/thumb/1.jpg",
	date:"4-16-98",
	ticket_link:"www.yahoo.com",
	about: "view my website"
)

Event.create(
	user_id:2,
	title: "A Wicked Event",
	photo:"http://l7.alamy.com/zooms/7372c9d283624c8997fa967be857623e/julie-grady-thomas-stand-up-comedy-performer-at-an-open-mike-night-d1mmwj.jpg",
	date:"4-16-98",
	ticket_link:"www.yahoo.com",
	about: "Some interesting facts"
)


5.times do
	Event.create(
		user_id:1,
		title: "A Great Event",
		photo:"http://c8.alamy.com/comp/HT19FB/audience-at-stand-up-comedy-shows-at-festival-lent-maribor-slovenia-HT19FB.jpg",
		date:"7-16-2016",
		ticket_link:"www.google.com",
		about: "This is the about section",
	)
end

Post.create(
	postable_id: 1,
	postable_type: 'Event',
	title: "comedy is the best",
	body: "come and have fun",
	author_id: 2
)

Post.create(
	postable_id: 1,
	postable_type: 'Event',
	title: "Tonight!!!",
	body: "see all the women of comedy",
	author_id: 1
)

Post.create(
	postable_id: 1,
	postable_type: 'User',
	title: 'Hello',
	body: 'Where you at?',
	author_id: 2
)

Post.create(
	postable_id: 2,
	postable_type: 'User',
	title: 'Hey',
	body: 'LIT',
	author_id: 1
)

Comment.create(
	post_id: 1,
	author_id: 1,
	body: "Comments go here"
)

Comment.create(
	post_id: 1,
	author_id: 2,
	body: "Hi everyone!! Welcome"
)

ConnectionRequest.create(
	sender_id:1,
	receiver_id: 2,
	status: true
)

ConnectionRequest.create(
	sender_id:3,
	receiver_id: 1,
	status: true
)

ConnectionRequest.create(
	sender_id: 1,
	receiver_id: 4,
	status: false
)

Notification.create(
	user_id: 2,
	recipient_id: 1,
	action: "connection_request",
	)

Notification.create(
	user_id: 2,
	recipient_id: 3,
	action: "connection_request",
	)

Notification.create(
	user_id: 2,
	recipient_id: 4,
	action: "connection_request",
	)

Notification.create(
	user_id: 2,
	recipient_id: 5,
	action: "connection_request",
	)

Notification.create(
	user_id: 2,
	recipient_id: 1,
	action: "connection_request",
	)
