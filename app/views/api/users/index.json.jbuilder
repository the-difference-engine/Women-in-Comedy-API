json.array! @users.each do |user|
	json.id user.id
	json.email user.email
	json.encrypted_password user.encrypted_password
	json.reset_password_token user.reset_password_token
	json.reset_password_sent_at user.reset_password_sent_at
	json.remember_created_at user.remember_created_at
	json.sign_in_count user.sign_in_count
	json.current_sign_in_at	user.current_sign_in_at
	json.last_sign_in_at user.last_sign_in_at
	json.current_sign_in_ip user.current_sign_in_ip
	json.last_sign_in_ip user.last_sign_in_ip
	json.created_at user.created_at
	json.updated_at user.updated_at
	json.admin user.admin
	json.super_admin user.super_admin
	json.first_name user.first_name
	json.last_name user.last_name
	json.birthday user.birthday
	json.about user.about
	json.avatar user.avatar
	json.video_link user.video_link
	json.location user.location
	json.website user.website
	json.training user.training
	json.experience user.experience

			json.comments user.comments.each do |comment|
				json.commenter_id comment.commenter_id
				json.commentable_type comment.commentable_type
				json.commentable_id comment.commentable_id
				json.created_at comment.created_at
				json.updated_at comment.updated_at
				json.body comment.body
			end

			json.connection_requests user.connection_requests.each do |connection_request|
				json.sender_id connection_request.sender_id
				json.receiver_id connection_request.receiver_id
				json.status connection_request.status
				json.created_at connection_request.created_at
				json.updated_at connection_request.updated_at
			end

			json.events user.events.each do |event|
				json.host_id event.host_id
				json.title event.title
				json.photo event.photo
				json.date event.date
				json.ticket_link event.ticket_link
				json.about event.about
				json.created_at event.created_at
				json.updated_at event.updated_at
			end

			json.posts user.posts.each do |post|
				json.user_id post.user_id
				json.title post.title
				json.body post.body
				json.created_at post.created_at
				json.updated_at post.updated_at
			end
end

