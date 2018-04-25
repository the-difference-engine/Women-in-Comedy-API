json.notifications @notifications.sort_by {|n| n[:created_at] } do |notification|
  json.id notification.id
  json.sent_from notification.user_id
  json.sent_to notification.recipient_id
  json.action notification.action
  json.created_at notification.created_at
  json.seen notification.seen
  json.sent_from_name notification.user.full_name

end
