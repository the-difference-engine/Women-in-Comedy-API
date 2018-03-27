json.notifications @notifications do |notification|
  json.id notification.id
  json.sent_from notification.recipient_id
  json.sent_to notification.user_id
  json.action notification.action
  json.created_at notification.created_at
  json.seen notification.seen
  json.sent_from_name notification.recipient.full_name

end
