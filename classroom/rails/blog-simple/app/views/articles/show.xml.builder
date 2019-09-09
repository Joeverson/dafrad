xml.article do
  xml.title @article.title
  xml.text @article.text
  xml.comments do
    @article.comments.each do |comment|
      xml.comment do
        xml.commenter comment.commenter
        xml.body comment.body
      end
    end
  end
end
