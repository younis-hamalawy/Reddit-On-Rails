# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_id     :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  validates :title, :sub, :author, presence: true

  belongs_to :sub
  belongs_to :author,
  class_name: "User",
  primary_key: :id,
  foreign_key: :user_id
end
