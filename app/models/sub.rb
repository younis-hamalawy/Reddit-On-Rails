# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, :moderator, presence: true

  belongs_to :moderator,
  class_name: "User",
  primary_key: :id,
  foreign_key: :user_id

  has_many :cross_posts,
    class_name: "PostSub",
    primary_key: :id,
    foreign_key: :post_id

  has_many :posts,
    through: :cross_posts,
    source: :posts
end
