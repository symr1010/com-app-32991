class Guide < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :content
    validates :image
  end

  belongs_to :user
  has_many   :messages
  has_one_attached :image
end
