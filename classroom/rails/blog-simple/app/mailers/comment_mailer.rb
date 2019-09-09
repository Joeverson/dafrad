class CommentMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def notify_comment(article, comment)
    @article = article
    @comment = comment
    # TODO email from article
    mail(to: 'a@a', subject: 'Comment Received')
  end
end
