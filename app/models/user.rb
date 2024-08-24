class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Following and Unfollowing
  has_many :active_relationships, class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed, dependent: :delete_all
  has_many :followers, through: :passive_relationships, source: :follower, dependent: :delete_all

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :movies, dependent: :destroy
  has_many :forums, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :room_messages, dependent: :delete_all

  validates :username, uniqueness: true, length: { minimum:1}

  scope :by_newest, -> { self.order(created_at: :desc) }
  scope :of_followed_users, -> (following_users) { where user_id: following_users }


  extend FriendlyId
  friendly_id :username, use: :slugged

  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  def feed
   following_ids = "SELECT followed_id FROM relationships
                    WHERE  follower_id = :user_id"
   Post.where("user_id IN (#{following_ids})
                    OR user_id = :user_id", user_id: id)
  end

  # User online?
  def online?
    updated_at > 5.minutes.ago
  end

end
