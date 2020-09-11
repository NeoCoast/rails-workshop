# frozen_string_literal: true

json.id post.id
json.title post.title
json.content post.content
json.username post.user.username
json.username_id post.user.id
json.date_created post.created_at

json.comments post.comments do |comment|
  json.partial! 'api/v1/comments/comment', comment: comment
end
