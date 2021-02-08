class Message < ApplicationRecord
  validates :comment, presence: true

  belongs_to :user
  belongs_to :guide
end
