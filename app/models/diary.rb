class Diary < ApplicationRecord
  validates :title,    length: { in: 1..14 }
  validates :sentence,    length: { in: 1..400 }
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
end
