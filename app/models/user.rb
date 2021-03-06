class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :project, dependent: :destroy
  has_many :roles, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :abilities, through: :skills
  has_one_attached :photo

  scope :filter_by_skill, -> (skill_id) { where skill_id: skill_id }

  def active_for_authentication?
    super && archived_at.nil?
  end

  def inactive_message
    archived_at.nil? ? super : :archived
  end

  def to_s
    email
  end

  scope :excluding_archived, lambda { where(archived_at: nil) }

  def full_name
    "#{first_name} #{last_name}"
  end

  def archive
    self.update(archived_at: Time.now)
  end

  def role_on(project)
    roles.find_by(project_id: project).try(:name)
  end
end
