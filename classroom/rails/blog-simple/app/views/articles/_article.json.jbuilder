# json.title article.title
# json.text article.text

json.extract! article, :title, :text
json.comments do
  json.array! article.comments, :commenter, :body
end
