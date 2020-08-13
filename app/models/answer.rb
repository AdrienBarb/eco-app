class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :comment

  after_create :author_watches_comment

  private

  def author_watches_comment
    if user.present? && !comment.watchers.include?(user)
      comment.watchers << user
    end
  end
end
