json.user_id post.user_id
json.title post.title
json.body post.body
json.created_at post.created_at
json.updated_at post.updated_at

json.comments post.comments do |comment|
	json.commenter_id comment.commenter_id
	json.commentable_type comment.commentable_type
	json.commentable_id comment.commentable_id
	json.created_at comment.created_at
	json.updated_at comment.updated_at
	json.body comment.body
end	