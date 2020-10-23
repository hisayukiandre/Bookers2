class Book < ApplicationRecord
	# 外部キーは基本的にモデル名＋_id
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}
end
