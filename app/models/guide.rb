class Guide < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :content
    validates :image
  end

  belongs_to :user
  has_many   :messages, dependent: :destroy
  has_one_attached :image

  def self.search(search)
    if search != ""
      Guide.where('title LIKE(?)', "%#{search}%")
    else
      Guide.all
    end
  end
end
