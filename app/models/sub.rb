class Sub < ApplicationRecord
  validates :title, presence: true
  validates :title, lenth: { minimum: 2 }
end
