# Preview all emails at http://localhost:3000/rails/mailers/notification
class NotificationPreview < ActionMailer::Preview
  def new_comment
    NotificationMailer.with(user: User.last, comment: Comment.last).new_comment
  end

end
