json.array! @events.each do |event|

	json.host_id event.host_id
	json.title event.title
	json.photo event.photo
	json.date event.date
	json.ticket_link event.ticket_link
	json.about event.about
	json.created_at event.created_at
	json.updated_at event.updated_at

	json.comments event.comments.each do |comment|
		json.commenter_id comment.commenter_id
		json.commentable_type comment.commentable_type
		json.commentable_id comment.commentable_id
		json.created_at comment.created_at
		json.updated_at comment.updated_at
		json.body comment.body
	end



end

