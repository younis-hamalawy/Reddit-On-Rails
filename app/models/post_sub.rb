# == Schema Information
#
# Table name: post_subs
#
#  id         :integer          not null, primary key
#  sub_id     :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostSub < ApplicationRecord
  validates :post, :sub, presence: true
  validates :post, uniqueness: { scope: :sub }

  belongs_to :posts
  belongs_to :subs

end
