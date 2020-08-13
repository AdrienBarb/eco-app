class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :answers
  has_and_belongs_to_many :watchers, join_table: "comment_watchers", class_name: "User", uniq: true

  after_create :author_watches_me

  private

  def author_watches_me
    if user.present? && !self.watchers.include?(user)
      self.watchers << user
    end
  end
end
