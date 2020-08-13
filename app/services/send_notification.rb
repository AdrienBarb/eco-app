class SendNotification

  attr_reader :user, :answer

  def initialize(user, answer)
    @user = user
    @answer = answer
  end

  def notify_watchers
    (@answer.comment.watchers - [@answer.user]).each do |user|
      NotificationMailer.with(user: user, answer: @answer).new_comment.deliver_now
    end
  end
end
